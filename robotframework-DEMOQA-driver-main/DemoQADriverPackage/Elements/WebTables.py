# -*- coding: utf-8 -*-
import lxml.html
from DemoQADriverPackage.instances import SELENIUM, screenshot_on_fail, BUILT_IN
from DemoQADriverPackage.data.elements import MAIN_XPATH, WEB_TABLES
from robot.api.deco import keyword


class WebTables():

    @screenshot_on_fail
    @keyword("Navigate To Text Box")
    def navigate_to_page(self):
        SELENIUM.click_element(MAIN_XPATH['web_tables'])

    @screenshot_on_fail
    @keyword("Choose Parameters")
    def choose_parameters(self, *params_and_values):
        parameters = params_and_values[::2]
        values = params_and_values[1::2]
        if not parameters or not values:
            raise ValueError("Missing parameters or values.")

        SELENIUM.click_element(WEB_TABLES['BUTTON']['add'])
        for param, value in zip(parameters, values):
            new_param_name = param.lower().replace(' ', '_')

            if new_param_name in WEB_TABLES['INPUT']:
                xpath = WEB_TABLES['INPUT'][new_param_name]
                SELENIUM.input_text(xpath, value)
            else:
                raise ValueError(f"Missing support for this param: {param}")
        SELENIUM.click_element(WEB_TABLES['BUTTON']['submit'])

    @screenshot_on_fail
    @keyword("Delete")
    def delete(self, row_index):
        SELENIUM.click_element(f'//*[@id="delete-record-{int(row_index)+1}"]')

    @screenshot_on_fail
    @keyword("Read All Parameters")
    def read_all_parameters(self):
        xpath_headers = '//*[@id="app"]/div/div/div/div[2]/div[2]/div[3]/div[1]/div[1]'
        xpath_data = '//*[@id="app"]/div/div/div/div[2]/div[2]/div[3]/div[1]/div[2]'

        inner_html = SELENIUM.get_element_attribute(xpath_headers, "innerHTML")
        root = lxml.html.fromstring(inner_html)
        headers = root.xpath(".//div")
        headers_lst = []

        for header in headers:
            text = header.text_content().lower().replace(' ', '_')
            if text and text != 'action' and text not in headers_lst:
                headers_lst.append(text)

        inner_html = SELENIUM.get_element_attribute(xpath_data, "innerHTML")
        root = lxml.html.fromstring(inner_html)
        divs = root.xpath(".//div")
        output = {}
        index_row = 0
        for div in divs:
            if 'role' in div.attrib and div.attrib['role'] == 'row':
                row_output = {}
                for idx, header in enumerate(headers_lst):
                    value = div.xpath(".//div")[idx].text_content()
                    row_output[header] = value
                output[index_row] = row_output
                index_row = index_row + 1
        return output

    @screenshot_on_fail
    @keyword("Update Parameters")
    def update_parameters(self, row_index, *params_and_values):
        parameters = params_and_values[::2]
        values = params_and_values[1::2]
        if not parameters or not values:
            raise ValueError("Missing parameters or values.")

        SELENIUM.click_element(f'//*[@id="edit-record-{int(row_index)+1}"]')
        for param, value in zip(parameters, values):
            new_param_name = param.lower().replace(' ', '_')

            if new_param_name in WEB_TABLES['INPUT']:
                xpath = WEB_TABLES['INPUT'][new_param_name]
                SELENIUM.clear_element_text(xpath)
                SELENIUM.input_text(xpath, value)
        SELENIUM.click_element(WEB_TABLES['BUTTON']['submit'])

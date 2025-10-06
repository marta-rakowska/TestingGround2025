# -*- coding: utf-8 -*-
from Libs.DemoQADriver.instances import SELENIUM
from Libs.DemoQADriver.Locators.Elements.textbox import xpath
from robot.api.deco import keyword

class textbox():

    @keyword("Navigate To Page")
    def navigate_to_page(self):
        SELENIUM.click_element(xpath['text_box'])

    @keyword("Choose Parameters")
    def choose_parameters(self, *params_and_values):
        parameters = params_and_values[::2]
        values = params_and_values[1::2]
        if not parameters or not values:
            raise ValueError("Missing parameters or values.")

        for param, value in zip(parameters, values):
            new_param_name = param.lower().replace(' ', '_')

            if new_param_name in xpath['INPUT']:
                SELENIUM.input_text(xpath['INPUT'][new_param_name], value)
            elif new_param_name in xpath['SELECT']:
                SELENIUM.select_from_list_by_value(xpath['SELECT'][new_param_name], value)
            else:
                raise ValueError(f"Missing support for this param: {param}")
        element = SELENIUM.get_webelement(xpath['BUTTON']['submit'])
        element.location_once_scrolled_into_view
        SELENIUM.click_element(xpath['BUTTON']['submit'])
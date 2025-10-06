# -*- coding: utf-8 -*-
from Libs.DemoQADriver.demoqa import SELENIUM
from Libs.DemoQADriver.Locators.main_page import xpath
from Libs.DemoQADriver.Elements.textbox import textbox
from robot.api.deco import keyword

class elements():

    def __init__(self):
        self.text_box = textbox()

    @keyword("Navigate To Page")
    def navigate_to_page(self):
        SELENIUM.scroll_element_into_view(xpath['elements'])
        SELENIUM.click_element(xpath['elements'])
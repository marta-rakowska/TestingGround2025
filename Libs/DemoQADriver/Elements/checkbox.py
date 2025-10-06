# -*- coding: utf-8 -*-
from Libs.DemoQADriver.instances import SELENIUM
from Libs.DemoQADriver.Locators.Elements.checkbox import xpath
from robot.api.deco import keyword

class checkbox():

    @keyword("Navigate To Page")
    def navigate_to_page(self):
        SELENIUM.click_element(xpath['check_box'])
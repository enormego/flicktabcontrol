# About FlickTabControl
**FlickTabControl** is an easy to use library of the "Flick" tab bar seen in popular **enormego** iPhone apps like Groundwork, Reader, and What's On The Radio.  **FlickTabControl** was originally inspired by the implementation of tabbing in Facebook's iPhone application.

# What you'll find
## Demo Project
The demo app shows you how simple it is to get going with **FlickTabControl**

## FlickTabControl Overview
* **FlickTableViewController:** Simplying replacing your UITableViewController subclass with FlickTableViewController, will instantly give you a FlickTabView implementation.  All you need to do is implement the necessary DataSource and Delegate methods to display the tabs you want.
* **FlickTabView:** Primary view for FlickTabControl, most of the action takes place here.

## Other Classes
### Internal classes for FlickTabView and FlickTableViewController.
* **FlickTabButton:** Subclass of UIControl, creates the tab used in FlickTabView

# Additional Information
## tableHeaderView
It's important to note that you can not set the tableHeaderView when using FlickTableViewController.  FlickTableViewController sets it's instance of FlickTabView to be displayed via tableHeaderView.

# Questions
Feel free to contact info@enormego.com if you need any other help with this library or wish to contribute bug fixes or feature enhancements.


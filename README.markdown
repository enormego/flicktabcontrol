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

# License
Copyright (c) 2009-2010 enormego

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


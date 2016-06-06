# TestBackgroundLayout

Test project for question on StackOverflow
http://stackoverflow.com/questions/37611132

When the line with "self.addBackground()" is uncommented, the tableview
no longer automatically sets the "inset" at the top, and thus the first couple
of rows will be hidden behind the navbar.

Thus if you add any view behind the tableview, you should set the contentInset
manually. See the commented lines in the ViewController.swift file.

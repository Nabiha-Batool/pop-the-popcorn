from pyck.forms import Form
from wtforms import validators
from wtforms.fields import (PasswordField, TextField, DateField, TextAreaField, RadioField,
                            BooleanField, SelectField, SelectMultipleField)

class SignupForm(Form):
    first_name = TextField('First Name', [validators.required("First Name cannot be empty")])
    last_name = TextField('Last Name', [validators.required("Last Name cannot be empty")])
    email = TextField('Email Address', [validators.Email(message="Invalid email format")])
    password = PasswordField('Password', [validators.required()])
    verify_password = PasswordField('Verify Password', [validators.required(),
                                          validators.EqualTo('password', 'Passwords must match')])
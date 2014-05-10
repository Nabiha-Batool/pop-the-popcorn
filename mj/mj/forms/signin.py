from pyck.forms import Form
from wtforms import validators
from wtforms.fields import (PasswordField, TextField, DateField, TextAreaField, RadioField,
                            BooleanField, SelectField, SelectMultipleField)

class SigninForm(Form):
    user_name = TextField('Email Address', [validators.Email(message="Invalid email format")])
    password = PasswordField('Password', [validators.required("Password cannot be empty")])
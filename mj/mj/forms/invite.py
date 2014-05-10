from pyck.forms import Form
from wtforms import validators
from wtforms.fields import (PasswordField, TextField, DateField, TextAreaField, RadioField,
                            BooleanField, SelectField, SelectMultipleField)

class InviteForm(Form):
    code = TextField('Code', [validators.required("Code cannot be empty")])
    email = TextField('Email Address', [validators.Length(min=6, max=35),
                                        validators.Email(message="Invalid email format")])

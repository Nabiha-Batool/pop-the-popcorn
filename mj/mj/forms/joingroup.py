from pyck.forms import Form
from wtforms import validators
from wtforms.fields import (PasswordField, TextField, DateField, TextAreaField, RadioField,
                            BooleanField, SelectField, SelectMultipleField) 

class JoingroupForm(Form):
    code = TextAreaField('Code', [validators.required("Code cannot be empty")])
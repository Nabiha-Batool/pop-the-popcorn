from pyck.forms import Form
from wtforms import SelectField, TextField, TextAreaField, validators


class InfoForm(Form):
    category_id = SelectField('Category', coerce=int)
    first_name   = TextField('First Name', [validators.required("First name cannot be empty")])
    description = TextAreaField("Description", [validators.required("Description cannot be empty")])


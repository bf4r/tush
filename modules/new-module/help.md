# new-module
Creates a new module from a template.

## Usage
```bash
new-module <module_name>
```

## Configuration
```bash
# Specifies the path to copy the template module folder from
$TUSHM_NEW_MODULE_TEMPLATE_PATH="$TUSH_PATH/templates/module"
```

## About templates
The template folder contains files that are recommended to stay in the module folder.
It also has placeholders like <<MODULENAME>> and <<MODULENAMEUPPER>>, which will be replaced with module-name and MODULE_NAME respectively when creating the module with new-module.

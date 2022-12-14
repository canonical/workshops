import pandas as pd
import yaml
import sys
import re

files = {
    'instance_config_schema.yaml':
    'https://linuxcontainers.org/lxd/docs/master/reference/instance_options/',
    'project_config_schema.yaml':
    'https://linuxcontainers.org/lxd/docs/master/projects/'
}


def stripNumber(string):
    match = re.match('(\d+)', string)
    if match:
        return match.group(1)
    return '-'


for filename, url in files.items():
    tables = [
        table for table in pd.read_html(url) if 'Default' in table.columns
    ]
    table = pd.concat(tables, ignore_index=True)

    table.update(
        table[table['Type'] == 'integer']['Default'].apply(stripNumber))

    config = table.replace('-', '').set_index('Key').to_dict('index')
    config = {
        key: {name: value
              for name, value in entry.items() if value}
        for key, entry in config.items()
    }

    with open(filename, 'w') as f:
        f.write(yaml.dump(config))

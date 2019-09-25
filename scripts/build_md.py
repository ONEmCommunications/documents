import os
import sys
import yaml


THIS_DIR = os.path.dirname(os.path.abspath(__file__))

BUILDING_SKEL = """## {obj}
{descr}

| KEY | TYPE | NOTES |
|-----|------|-------|
{tbody}\n\n"""


def write_building(data):

    content = ""

    for k, v in data.items():
        tbody = []
        for prop in sorted(v['properties'].items(), key=lambda x: x[0]):
            key, value = prop

            type_ = value.get('type', 'object')
            notes = value['description']

            # place the available items under description
            if 'enum' in value:
                notes += '<br> _available: `{}`_'.format(
                    ', '.join('"{}"'.format(item) for item in value['enum'])
                )

            # build the row
            if key in v.get('required', []):
                tr = f"|*{key}|{type_}|{notes}|"
            else:
                if value.get('const') is not None:
                    tr = f"|*{key}|{type_}|{notes}|"
                else:
                    tr = f"|{key}|{type_}|{notes}|"

            tbody.append(tr)

        tbody = '\n'.join(tbody)

        content += BUILDING_SKEL.format(
            obj=k, descr=v['description'], tbody=tbody
        )

    path = os.path.join(THIS_DIR, 'building.md')

    with open(path, 'w') as f:
        f.write(content)

    return


if __name__ == '__main__':
    try:
        schema_path = sys.argv[1]
    except IndexError:
        schema_path = os.path.join(THIS_DIR, 'schema.yaml')

    if not os.path.isfile(schema_path):
        sys.exit(
            f'Invalid schema.yaml file. Either place schema.yaml in '
            f'{THIS_DIR} or run: python {__file__} /path/to/schema.yaml')

    with open(schema_path) as f:
        data = yaml.load(f.read(), Loader=yaml.SafeLoader)

    write_building(data['components']['schemas'])

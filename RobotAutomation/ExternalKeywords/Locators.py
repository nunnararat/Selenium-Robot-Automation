import  json
import  jsonpath

def read_locator_from_json(locatorname):
    jsonfile_path = open('C:/information/TestingWorld/RobotAutomation/JsonFiles/Elements.json')
    response = json.loads(jsonfile_path.read())
    value = jsonpath.jsonpath(response, locatorname)
    return value[0]
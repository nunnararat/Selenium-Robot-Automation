
# import  json

# odics = '{"K1" : "val1", "K2" : "val2"}'
# json_result = json.loads(odics)
# print(json_result['K1'])


import  json
import  requests
import  jsonpath


api_url = "https://reqres.in/api/users?page=2"

# Make a request
# ใช้ไลบรารี requests เพื่อทำ HTTP GET request ไปยัง API endpoint ที่กำหนด. ผลลัพธ์จะถูกเก็บไว้ในตัวแปร response1.
response1 = requests.get(api_url)
# print(response1.text)

# Validate Status code
# ใช้คำสั่ง assert เพื่อตรวจสอบว่า status code ที่ได้จาก response เป็น 200 (OK). ถ้าไม่ใช่จะทำให้โปรแกรมหยุดทำงานและแสดงข้อความข้อผิดพลาด.
assert  response1.status_code == 200


# Parse response into JSON format
# ใช้ไลบรารี json เพื่อแปลงข้อมูลที่ได้จาก response (ในรูปของข้อความ) เป็นรูปแบบ JSON เพื่อให้ง่ายต่อการใช้งาน โดยเก็บไว้ในตัวแปร json_response
json_response = json.loads(response1.text)
print(json_response)

# Apply JSON Path
x = jsonpath.jsonpath(json_response, 'total')
y = jsonpath.jsonpath(json_response, 'data[0].first_name')
print(x)
print(y)
print(y[0])


for value in json_response['data']:
    print(value['first_name'])
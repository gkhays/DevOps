import requests
from json2html import * # Not best practice :(
from flask import Flask

app = Flask(__name__)

# http://stackoverflow.com/a/7750945/6146580
# http://docs.python-requests.org/en/master/

"""
OAUth
>>> import requests
>>> from requests_oauthlib import OAuth1

>>> url = 'https://api.twitter.com/1.1/account/verify_credentials.json'
>>> auth = OAuth1('YOUR_APP_KEY', 'YOUR_APP_SECRET',
                  'USER_OAUTH_TOKEN', 'USER_OAUTH_TOKEN_SECRET')

>>> requests.get(url, auth=auth)
<Response [200]>

http://docs.python-requests.org/en/master/user/authentication/
"""

def connect(url):
    status = None
    response = requests.get(url, auth=('root', 'n0v3ll'))
    status = response.status_code
    print "Status:", status
    print "Content type:", response.headers['content-type']
    print "Encoding:", response.encoding
    print "Headers:", response.headers

    if status != 204:
        print "Text:", response.text
        print response.json()
    
    return status

# GET: http://docs.python-requests.org/en/master/user/quickstart/
def get(uri):
    r = requests.get(uri, auth = ('root', 'n0v3ll'))
    print r.status_code
    return r.json()

# Session: http://docs.python-requests.org/en/master/user/advanced/
def post(url):
    cookies = dict(cookies_are='OSESSIONID=OS14686186857686616054184630571232; Path=/; HttpOnly')
    payload = { 'command': 'select from V'}
    s = requests.session()
    s.auth = ('root', 'n0v3ll')
    r = s.post(url, payload)
    print r.status_code

@app.route("/")
def main():
    base_url = 'http://192.168.99.100:2480/'
    path = 'connect/ar-graph'
    url = base_url + path
    print "Connecting to", url, "..."
    status = connect(url)

    # Easy query: SELECT FROM V
    # Tougher query: TRAVERSE * FROM #13:4
    # Query is idempotent
    sql = 'SELECT FROM V'
    uri = base_url + 'query/ar-graph/sql/' + sql
    print "GET:", uri
    json = get(uri)
    print json

    # Convert dict/json to html table
    # https://pypi.python.org/pypi/json2html
    # http://json2html.varunmalhotra.xyz/#sendButton
    converted = json2html.convert(json = json, 
            table_attributes="class=\"table table-condensed table-bordered table-hover\"")
    return converted #"Simple web page"

    # TODO - Work in progress
    """
    path = 'command/ar-graph/sql'
    url = base_url + path
    print "POST:", url
    post(url)
    """

if __name__ == "__main__":
    app.run() #main()
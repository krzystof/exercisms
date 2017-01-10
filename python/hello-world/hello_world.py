import sys
reload(sys)
sys.setdefaultencoding('utf-8')

def hello(name=''):
        return 'Hello, {}!'.format(name if name else 'World')


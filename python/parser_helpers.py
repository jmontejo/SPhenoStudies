import argparse
import sys

# create a keyvalue class for argparse
class keyvalue(argparse.Action):
    def __call__( self , parser, namespace,
                 values, option_string = None):
        setattr(namespace, self.dest, dict())
          
        for value in values:
            key, value = value.split('=')
            getattr(namespace, self.dest)[key] = float(value)

# create a keyvaluevalue class for argparse
class keyvaluevalue(argparse.Action):
    def __call__( self , parser, namespace,
                 value, option_string = None):

        key, value = value.split(':')
        v1,v2 = value.split('=')
        setattr(namespace, self.dest, (key,v1,float(v2)))

# create a keyrange class for argparse
class keyrange(argparse.Action):
    def __call__( self , parser, namespace,
                 values, option_string = None):
        setattr(namespace, self.dest, dict())
          
        for value in values:
            key, value = value.split('=')
            try:
                getattr(namespace, self.dest)[key] = eval(value)
            except SyntaxError as err:
                import logging
                log = logging.getLogger(__name__)
                log.error("Found syntax error in range definition: {}".format(err))
                sys.exit(1)


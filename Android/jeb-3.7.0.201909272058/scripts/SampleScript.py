# -*- coding: utf-8 -*-
from com.pnfsoftware.jeb.util.encoding.IntegerLEB128 import DecodedInt
from com.pnfsoftware.jeb.client.api import IScript
from com.pnfsoftware.jeb.core.units.code.asm.processor import AbstractProcessor
"""
Sample client script for PNF Software's JEB.
More samples are available on our website and within the scripts/ folder.
Refer to SCRIPTS.TXT for more information.
"""
class SampleScript(IScript):
  def run(self, ctx):
    # For non-ASCII characters, remember to specify the encoding in the script header (here, UTF-8),
    # and do not forget to prefix all Unicode strings with "u", whether they're encoded (using \u or else) or not
    print('~~~\n' + u'Hello, 안녕하세요, 你好, こんにちは!\n' + 'This line was generated by a JEB Python script\n~~~')

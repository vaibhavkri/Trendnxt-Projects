from TestCases import *
import xml.etree.ElementTree as ET
from xml.dom import minidom
import re, os, sys
import time, traceback


def createXML(results):
	"""Creates an XML file"""

	try:
		testresult = ET.Element("testresult")
	
		for index,value in enumerate(results):
			text = "testno" + str(index+1)
			ET.SubElement(testresult,text).text = value
		
		testpassed = ET.SubElement(testresult,"testpassed")
		testpassed.text = str(results.count("Passed"))
		
		testfailed = ET.SubElement(testresult,"testfailed")
		testfailed.text = str(results.count("Failed"))

		testerror = ET.SubElement(testresult,"testerror")
		testerror.text = str(results.count("Error"))

		xml = ET.tostring(testresult,'utf-8')
		parsedXml = (minidom.parseString(xml)).toprettyxml(indent = " ")
		
		testResult = 'TestResults/'+time.strftime("%d-%m-%Y")+'.xml'

		if not os.path.exists("TestResults"):
			os.makedirs("TestResults")

		with open(testResult,'w+') as f:
			f.write(parsedXml)

		return "\nSuccessfully created the xml, results updated\n"

	except Exception as e:
		print "\nXML creation failed\n"
		traceback.print_exc()


def runTest():
	"""Runs the test scenarios"""
	
	try:
		results = [oddTest(),primeTest(),stringTest()]
		
		print createXML(results)

		print "\nTests run succesfully\n"

	except Exception as e:
		print "\nTest Execution failed\n"
		traceback.print_exc()

def listTest():
	"""Lists the test results"""

	try:
		print "\nTest Result List\n"
	
		for result in os.listdir("TestResults/"):
			print result
	
	except Exception as e:
		print "\nListing failed\n"
		traceback.print_exc()

def showTest():
	""" shows the results tabulated"""
	
	try:
		resultFile = "TestResults/"+raw_input("Please enter the test result file name : ")

		testResult(resultFile)

	except Exception as e:
		print "\nFailed to show the test results\n"
		traceback.print_exc()


def testResult(resultFile):
	""" Populates the XML into a table """

	try:
		result = ET.parse(resultFile)
		
		root = result.getroot()

		print "="*50

		print resultFile.split('/')[0] +"    "+re.findall(r'\d\d-\d\d-\d\d\d\d',resultFile)[0]

		print "="*50
		
		for index,value in enumerate(root):
			if index == 3:
				print "Total tests passed : " + value.text
			elif index == 4:
				print "Total tests failed : " + value.text
			elif index == 5:
				print "Total tests with errors : " + value.text		
			else:
				print "Test File No.%d -- "%(index+1) + value.text
			
		print "="*50

	except Exception as e:
		print "\nFailed to fetch the test results\n"
		traceback.print_exc()



def generateTest():
	"""generates a HTML test report"""
	
	try:
		resultFile = "TestResults/"+raw_input("Please enter the test result file name : ")
		htmlReport = resultFile.split('.')[0]+".html"	
		
		sys.stdout = open("testResult.log","w")
		testResult(resultFile)
		sys.stdout = sys.__stdout__

		contents = open("testResult.log","r")
		with open(htmlReport,"w") as hR:
			for lines in contents.readlines():
				hR.write("<pre>" + lines + "</pre><br>\n")
		
		print "\ngenerated the HTML report successfully\n"

	except Exception as e:
		print "\nFailed to generate HTML report\n"
		traceback.print_exc()

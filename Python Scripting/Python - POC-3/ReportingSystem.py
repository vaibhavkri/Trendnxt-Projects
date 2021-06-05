from TestSystem import *

def main():
	"""Lists all the options available for test"""

	while(True):
		print "\n"+"Test Management Reporting System".center(40,'*')+"\n"
		print "Select your option and press Enter\n"\
			"1. Run Test Cases\n"\
			"2. List Test Runs\n"\
			"3. Show Test Results\n"\
			"4. Generate a HTML test report\n"\
			"5. Exit\n"

		choice = input(">>")
		
		if choice == 1:
			runTest()
		elif choice == 2:
			listTest()
		elif choice == 3:
			showTest()
		elif choice == 4:
			generateTest()
		elif choice == 5:
			print "Thank you".center(40,'*')
			break
		else:
			print "Invalid choice\n"


if __name__ == "__main__":
        main()

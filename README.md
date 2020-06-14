# automation-robotframework

This is my practice codes for robot framework and selenium library.

Prerequisites:

	1. Optional: Install Pycharm CE  
	2. Optional: Install Pycharm CE plugin - Robot Framework Support
	3. Optional:Use VENV as interpreter
	4. update/install latest Python 3
	5. "pip install --upgrade pip"
	6. "pip install --upgrade setuptools"
	7. "pip install robotframework"
	8. "pip install robotframework-seleniumlibrary"
	9. "brew cask install chromedriver" | "brew install geckodriver"
  
run in cmd/terminal: robot --outputdir automationpractice.com/tests/hc/results/`date +%Y%m%d-%s` --variable BROWSER:headlesschrome automationpractice.com/tests/hc/tech_exam_with_page_resource.robot

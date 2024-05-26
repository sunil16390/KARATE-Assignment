Feature: post data to petstore and validation get call

  Background:

    * def serviceURl = 'https://petstore.swagger.io/v2/pet'

  Scenario Outline: Read test data from excel do post call to petstore website
    Given url serviceURl
    * def readXLJavaObj = Java.type('support.ReadXL')
    * def IDFromInputFile = readXLJavaObj.read_And_Print_XL_AsPerTestData('<TestCase>','Pet ID')
    * def NameFromInputFile = readXLJavaObj.read_And_Print_XL_AsPerTestData('<TestCase>','Pet Name')
    * def javaFileObj = Java.type('support.ReadJsonBody')
    * def requestJsonBody = javaFileObj.create_json_body_for_job_call(IDFromInputFile,NameFromInputFile)
    #Then print 'body is : ', requestJsonBody
    And request requestJsonBody
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And method post
    And match responseType == 'json'
    #And print 'Response is: ', response
    Then status 200
    And response.id == IDFromInputFile
    And response.name == NameFromInputFile

    Examples:
      |TestCase|
      |TC001   |
      |TC002   |
      |TC003   |
      |TC004   |
      |TC005   |
      |TC006   |
      |TC007   |
      |TC008   |
      |TC009   |
      |TC010   |
      |TC011   |
      |TC012   |
      |TC013   |
      |TC014   |
      |TC015   |
      |TC016   |
      |TC017   |
      |TC018   |
      |TC019   |
      |TC020   |
      |TC021   |
      |TC022   |
      |TC023   |
      |TC024   |
      |TC025   |
      |TC026   |
      |TC027   |
      |TC028   |
      |TC029   |
      |TC030   |


    Scenario Outline: Using GET CALL validate created PET details
      Given url 'https://petstore.swagger.io/v2/pet/<petID>'
      When method Get
      And match responseType == 'json'
      And assert responseTime < 2000
      And print response
      Then status 200
      And response.id == '<petID>'
      And response.name == '<petName>'

      Examples:
        | petID |petName|
        |100|Kitty|
        |101|Doggy|
        |102|Mithu|
        |103|Momo |
        |104|Puntu|
        |105|Mona |
        |106|Sweety|
        |107|Cutie |
        |108|Bunny |
        |109|Tipu  |
        |110|Tuntun|
        |111|Mantu |
        |112|Guddi |
        |113|Gudiya|
        |114|Pihu  |
        |115|Chiku |
        |116|Cow   |
        |117|Deer  |
        |118|Turtle|
        |119|Fish  |
        |120|Rabbit|
        |121|Rat   |
        |122|Parrot|
        |123|Elephant|
        |124|Ox      |
        |125|Buffalo |
        |126|Goat    |
        |127|Rooster |
        |128|Hen     |
        |129|Horse   |

   Scenario Outline: Using DELETE CALL delete PET and validate
     Given url 'https://petstore.swagger.io/v2/pet/<petID>'
     And headers {Accept: 'application/json'}
     When method Delete
     And print response
     Then status 200
     And response.message == '<petID>'

     Examples:
       | petID |
       |100    |





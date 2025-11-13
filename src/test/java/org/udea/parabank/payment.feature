@parabank_payment
Feature: Payment Feature

Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_accountId = 15564
    * def val_exceededAmount = 10000
    * def val_name = 'Pedro Perez'
    * def val_street = 'Colombia'
    * def val_city = 'Medellin'
    * def val_state = 'Texas'
    * def val_zipCode = '2020'
    * def val_phoneNumber = '1234'
    * def val_accountNumber = '1234'

Scenario: Payment with insufficient funds
    Given path 'billpay'
    And param accountId = val_accountId
    And param amount = val_exceededAmount
    And request
    """
    {
        "name": "#(val_name)",
        "address": {
            "street": "#(val_street)",
            "city": "#(val_city)",
            "state": "#(val_state)",
            "zipCode": "#(val_zipCode)"
        },
        "phoneNumber": "#(val_phoneNumber)",
        "accountNumber": "#(val_accountNumber)"
    }
    """
    When method post
    Then status 400
    And match response ==
    """
    {
        "accountId": "#(val_accountId)",
        "amount": "#(val_exceededAmount)",
        "payeeName": "#(val_name)"
    }
    """



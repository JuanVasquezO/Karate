@parabank_payment
Feature: Payment Feature

Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_accountId = 21669
    * def val_exceededAmount = 10000
    * def val_name = 'Mary Smith'
    * def val_street = '123 Main St'
    * def val_city = 'Springfield'
    * def val_state = 'IL'
    * def val_zipCode = '62701'
    * def val_phoneNumber = '555-1234'
    * def val_accountNumber = '12350'

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



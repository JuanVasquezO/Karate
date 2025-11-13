@parabank_accounts
Feature: Accounts Feature

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_accountId = 13122
    * def val_customerId = 12212
    * def val_accountType = 'CHECKING'

  Scenario: Retrieve account details by accountId
    Given path 'accounts'
    And path val_accountId //accountId
    When method get
    Then status 200
    And match response ==
    """
    {
        "id": '#(val_accountId)',
        "customerId": '#(val_customerId)',
        "type": '#(val_accountType)',
        "balance": '#number'
    }
    """

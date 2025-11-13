@parabank_accounts
Feature: Accounts Feature

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_accountId = 15564
    * def val_customerId = 16208
    * def val_accountType = 'SAVINGS'

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

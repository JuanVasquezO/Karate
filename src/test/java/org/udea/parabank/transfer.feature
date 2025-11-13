@parabank_transfer
Feature: Transfer Feature

  Background:
    * url baseUrl
    * header Content-Type = 'application/x-www-form-urlencoded'
    * def val_fromAccountId = 21780
    * def val_toAccountId = 21669
    * def val_amount = 10.0

  Scenario: Transfer between accounts and verify success message

    Given path 'transfer'
    And param fromAccountId = val_fromAccountId
    And param toAccountId = val_toAccountId
    And param amount = val_amount
    When method post
    Then status 200
    And match response contains 'Successfully transferred'
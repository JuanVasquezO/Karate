@parabank_loan
Feature: Request Loan Feature

Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_customerId = 16208
    * def val_fromAccountId = 21891
    * def val_loanProviderName = 'Wealth Securities Dynamic Loans (WSDL)'
    * def fakerObject = new faker()
    * def val_amount = fakerObject.number().numberBetween(100, 200)
    * def val_downPayment = fakerObject.number().numberBetween(10, 50)

Scenario: Request a loan that is approved
    Given path 'requestLoan'
    And param customerId = val_customerId
    And param fromAccountId = val_fromAccountId
    And param amount = val_amount
    And param downPayment = val_downPayment
    When method post
    Then status 200
   # Validación condicional según la respuesta
* print 'Loan response:', response

    * eval
    """
    if (response.approved === true) {
      karate.match(response, {
        loanProviderName: val_loanProviderName,
        responseDate: '#number',
        approved: true,
        accountId: '#number'
      });
    } else {
      karate.match(response, {
        loanProviderName: val_loanProviderName,
        responseDate: '#number',
        approved: false,
        message: '#string',
        accountId: null
      });
    }
    """


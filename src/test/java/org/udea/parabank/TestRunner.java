package org.udea.parabank;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate test01_ParabankLogin() {
        return Karate.run("login")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test02_ParabankPayment() {
        return Karate.run("payment")
                .tags("@parabank_payment")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }

    @Karate.Test
    Karate test03_ParabankLoan() {
        return Karate.run("loan")
                .tags("@parabank_loan")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }
    @Karate.Test
    Karate test04_ParabankAccountById() {
        return Karate.run("accounts")
                .tags("@parabank_accounts")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }
    @Karate.Test
    Karate test05_ParabankTransfer() {
        return Karate.run("transfer")
                .tags("@parabank_transfer")
                .relativeTo(getClass())
                .outputCucumberJson(true);
    }
}

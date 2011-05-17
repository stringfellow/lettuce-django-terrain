Feature: Registering
    In order to use some site
    As a random user
    We must register

    Scenario: Access the registration page when logged out
        I am not logged in
        Then I hit the template "homepage.html"
        And I access the reversed url "registration_register"
        Then I hit the template "registration/registration_form.html"
        Then I see the header "Registration"

    Scenario: Fill in the registration
        Using selenium
        I am not logged in
        Given a timeout of "10000"
        And I access the reversed url "registration_register"
        I see that the form "Registration Form" required fields are present
        Fill the field "id_email" with "<email>"
        Fill the field "id_password1" with "<password1>"
        Fill the field "id_password2" with "<password2>"
        Fill the field "id_first_name" with "<first_name>"
        Fill the field "id_last_name" with "<last_name>"
        Check the field "id_tos" with "<tos>"
        Click on "input[value=Register]" button
        Result of form submission should be "<result>"
        If the result "<result>" is pass then I see the text "Registration successful"
        Finished using selenium

    Examples:
        | email                    | password1   | password2   | first_name | last_name | tos       | result |
        | testing<<rnd>>@gmail.com | Testings123 | Testings123 | Testings   | Face      | checked   | pass   |
        | testing<<rnd>>@gmail.com | Testings123 | Testings123 | Testings   | Face      | unchecked | fail   |
        | testing<<rnd>>@gmail.com | Testings123 |  estings123 | Testings   | Face      | checked   | fail   |
        | testing<<rnd>>@gmail.com | Testings123 | Testings123 | Testings   | Face      | checked   | fail   |
        | testing<<rnd>>@gmail.com | Testings123 | Testings123 | Testings   | Face      | checked   | pass   |

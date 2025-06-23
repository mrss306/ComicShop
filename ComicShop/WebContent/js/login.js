document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('loginform');
    const errorSpan = document.getElementById('errorspan');
    const alertDiv = document.querySelector('.alert');
    const closeBtn = document.querySelector('.closebtn');

    const patterns = {
        un: /^[a-zA-Z0-9]{2,30}$/,
        pw: /^.{8,}$/
    };

    const errorMessages = {
        un: "Username non valido (2-30 caratteri alfanumerici)",
        pw: "Password troppo corta (minimo 8 caratteri)"
    };

    alertDiv.style.display = 'none';

    closeBtn.addEventListener('click', function() {
        hideError();
    });

    form.querySelectorAll('input').forEach(input => {
        input.addEventListener('change', function() {
            validateField(this);
        });
        
        input.addEventListener('input', function() {
            validateField(this);
        });
    });

    form.addEventListener('submit', function(e) {
        let isValid = true;
        let firstErrorField = null;

        form.querySelectorAll('input').forEach(input => {
            if (!validateField(input) && isValid) {
                isValid = false;
                firstErrorField = input;
            }
        });

        if (!isValid) {
            e.preventDefault();
            showError(errorMessages[firstErrorField.name]);
            firstErrorField.focus();
        } else {
            hideError();
        }
    });

    function validateField(field) {
        const value = field.value.trim();
        const fieldName = field.name;
        
        if (patterns[fieldName]) {
            if (!patterns[fieldName].test(value)) {
                markAsInvalid(field);
                return false;
            } else {
                markAsValid(field);
                return true;
            }
        }
        
        return true;
    }

    function markAsInvalid(field) {
        field.style.borderColor = '#f44336';
        field.style.borderWidth = '2px';
    }

    function markAsValid(field) {
        field.style.borderColor = '#4CAF50';
        field.style.borderWidth = '2px';
    }

    function showError(message) {
        errorSpan.textContent = message;
        alertDiv.style.display = 'block';
        setTimeout(hideError, 5000);
    }

    function hideError() {
        alertDiv.style.display = 'none';
    }

    const serverError = document.querySelector('.error');
    if (serverError && serverError.textContent.includes('Le credenziali inserite sono sbagliate')) {
        showError("Credenziali non valide. Riprova o crea un nuovo account.");
    }
});
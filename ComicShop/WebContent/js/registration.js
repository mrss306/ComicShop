document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('myform');
    const errorSpan = document.getElementById('errorspan');
    const alertDiv = document.querySelector('.alert');
    const closeBtn = document.querySelector('.closebtn');

    const patterns = {
        usr: /^[a-zA-Z0-9]{2,30}$/,
        nome: /^[a-zA-Zàèéìòù]{1,45}$/,
        cogn: /^[a-zA-Zàèéìòù]{1,45}$/,
        email: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/,
        pwd: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}$/,
        num_tel: /^[0-9]{10,15}$/,
        paese: /^.{1,45}$/,
        via: /^[a-zA-Z0-9àèéìòù\s.,-]{1,100}$/,
        citta: /^[a-zA-Zàèéìòù\s]{1,45}$/,
        provincia: /^[A-Z]{2}$/,
        carta: /^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$/
    };

    const errorMessages = {
        usr: "Username non valido (2-30 caratteri alfanumerici)",
        nome: "Nome non valido (max 45 lettere, senza spazi)",
        cogn: "Cognome non valido (max 45 lettere, senza spazi)",
        email: "Email non valida (formato: qualcosa@qualcosaltro.qualcosa)",
        pwd: "Password troppo debole (minimo 5 caratteri, 1 maiuscola, 1 minuscola, 1 numero)",
        num_tel: "Numero di telefono non valido (10-15 cifre)",
        paese: "Paese non valido (max 45 caratteri)",
        via: "Indirizzo non valido (max 100 caratteri, lettere e numeri)",
        citta: "Città non valida (max 45 caratteri)",
        provincia: "Provincia non valida (es. SA)",
        carta: "Carta di credito non valida (formato: 1234-1234-1234-1234)"
    };

    closeBtn.addEventListener('click', function() {
        hideError();
    });

    const cartaInput = document.querySelector('input[name="carta"]');
    cartaInput.addEventListener('input', function(e) {
        let value = e.target.value.replace(/-/g, '');
        if (value.length > 0) {
            value = value.match(new RegExp('.{1,4}', 'g')).join('-');
        }
        e.target.value = value;
        validateField(e.target);
    });

    form.querySelectorAll('input').forEach(input => {
        input.addEventListener('change', function() {
            validateField(this);
        });
        
        if (['carta', 'num_tel', 'email', 'usr'].includes(input.name)) {
            input.addEventListener('input', function() {
                validateField(this);
            });
        }
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
});
# frozen_string_literal: true

User.create(gender_id: Gender::MAN.id,
            age: 18,
            name: 'User_A',
            birthday: '2000/11/11',
            email: 'a@co.jp',
            phone: '080-1234-5678',
            zip: '1600022',
            state: 'Tokyo',
            city: 'Shinjuku-Ku',
            street: 'Yotuya-Saka-Machi',
            password: 'Pass1234',
            password_confirmation: 'Pass1234')

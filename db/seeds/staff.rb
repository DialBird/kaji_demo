# frozen_string_literal: true

Staff.create(gender_id: Gender::MAN.id,
             age: 18,
             name: 'TestStaff',
             birthday: Time.parse('2000/11/11'),
             email: 'a@co.jp',
             phone: '080-1234-5678',
             zip: '1600022',
             state: 'Tokyo',
             city: 'Shinjuku-Ku',
             street: 'Yotuya-Saka-Machi',
             password: '1234Abcd',
             password_confirmation: '1234Abcd')

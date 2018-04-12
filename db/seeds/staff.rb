# frozen_string_literal: true

Staff.create(gender_id: Gender::MAN.id,
             age: 18,
             name: 'Staff_A',
             birthday: '2000/11/11',
             email: 'a@co.jp',
             phone: '080-1234-5678',
             zip: '1600022',
             state: 'Tokyo',
             city: 'Shinjuku-Ku',
             street: 'Yotuya-Saka-Machi',
             password: 'Pass1234',
             password_confirmation: 'Pass1234',
             regular_shifts_attributes: [
               { dayofweek_id: 1, start_at: 3, end_at: 19 },
               { dayofweek_id: 2, start_at: 3, end_at: 9 },
               { dayofweek_id: 3, start_at: 3, end_at: 19 },
               { dayofweek_id: 4, start_at: 3, end_at: 9 },
               { dayofweek_id: 5, start_at: 3, end_at: 19 }
             ])
IrregularOff.create(staff_id: 1, date: Date.current + 1.day, start_at: 5, end_at: 10)

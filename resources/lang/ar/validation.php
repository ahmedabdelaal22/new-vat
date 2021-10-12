<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */
    'name' => [
        'required' => ' من فضلك ادخل الاسم ',
    ],

    'name_ar' => [
        'required' => ' من فضلك ادخل الاسم  باللغة العربية ',
    ],
    'name_en' => [
        'required' => ' من فضلك ادخل الاسم باللغة الانجليزية ',
    ],

    'initial_balance' => [
        'numeric' => 'الرصيد الافتتاحي لابد أن يكون أرقام ',
        'max' => ' من فضلك ادخل رصيد فاتتاحي أقل من 1000000',

    ],

    'page_id' => [
        'required' => ' يرجى إدخال الصفحة. '
    ],


    'post_id' => [
        'required' => 'يرجى إدخال المشاركة '
    ],

    'email_' => [
        'required' => 'يرجى إدخال البريد الإلكتروني الصحيح',
        'email' => 'يرجى إدخال البريد الإلكتروني الصحيح',
        'unique' => 'هذا البريد مستخدم من قبل '
    ],
    'contacts' => [
        'phones' => [
            'required' => ' يرجى إدخال الهاتف',
            'numeric' => ' يرجى إدخال الهاتف الصحيح',
            'unique' => ' استخدم هذا الهاتف من قبل',
        ]
    ],

    'phones' => [
        'required' => ' يرجى إدخال الهاتف',
        'numeric' => ' يرجى إدخال الهاتف الصحيح',
        'unique' => ' استخدم هذا الهاتف من قبل',
    ],
    'client_id' => [
        'required' => ' يرجى تحديد العميل '
    ],
    'amount' => [
        'required' => ' يرجى إدخال المبلغ ',
        'numeric' => ' الرجاء إدخال المبلغ الصحيح',
        'max' => ' من فضلك ادخل كمية أقل من 1000000',
    ],
    'date' => [
        'required' => ' يرجى إدخال التاريخ',
        'date' => ' يرجى إدخال التاريخ الصحيح'
    ],
    'category_id' => [
        'required' => ' يرجى تحديد الفئة '
    ],
    'unit_price' => [
        'required' => ' الرجاء إدخال السعر ',
        'numeric' => ' الرجاء إدخال السعر الصحيح ',
        'max' => ' من فضلك ادخل سعر الوحدة أقل من 1000000',
    ],
    'basic_title' => [
        'required' => ' الرجاء إدخال العنوان  ',
    ],
    'basic_body' => [
        'required' => ' الرجاء إدخال النص  ',
    ],
    'users' => [
        'required' => ' الرجاء اختيار مستخدمين  ',
    ],

    'purchase_price' => [
        'required' => ' الرجاء إدخال سعر الشراء',
        'numeric' => ' الرجاء إدخال سعر الشراء الصحيح',
        'max' => ' من فضلك ادخل سعر الشراء أقل من 1000000',

    ],
    'sale_price' => [
        'required' => ' الرجاء إدخال سعر البيع',
        'numeric' => ' الرجاء إدخال سعر البيع الصحيح',
        'max' => ' من فضلك ادخل سعر البيع أقل من 1000000',

    ],
    'lead_id' => [
        'required' => 'يرجى تحديد عميل محتمل '
    ],
    'details' => [
        'required' => ' يرجى إدخال التفاصيل '
    ],
    'user_id' => [
        'required' => ' يرجى تحديد مستخدم '
    ],
    'connection_way_id' => [
        'required' => 'يرجى تحديد طريقة الاتصال '
    ],
    'operation_date' => [
        'required' => ' يرجى إدخال تاريخ العملية ',
        'date' => ' يرجى إدخال التاريخ الصحيح '
    ],
    'operation_time' => [
        'required' => ' يرجى إدخال وقت العملية'
    ],
    'employee_id' => [
        'required' => 'يرجى اختيار الموظف'
    ],
    'client_id' => [
        'required' => ' يرجى تحديد العميل '
    ],
    'lead_status_id' => [
        'required' => ' يرجى تحديد حالة العميل المحتمل '
    ],
    'title' => [
        'required' => ' يرجى إدخال العنوان '
    ],
    'supplier_id' => [
        'required' => ' الرجاء اختيار المورد'
    ],
    'code' => [
        'required' => ' يرجى إدخال الرمز '
    ],
    'inventory_id' => [
        'required' => ' يرجى تحديد المخزون '
    ],
    'discount' => [
        'required' => ' الرجاء إدخال الخصم'
    ],
    'payment_type' => [
        'required' => ' يرجى تحديد نوع الدفع'
    ],
    'discount_type' => [
        'required' => 'الرجاء تحديد نوع الخصم '
    ],
    'discount_amount' => [
        'required' => ' الرجاء إدخال مبلغ الخصم ',
        'max' => ' من فضلك ادخل سعر خصم أقل من 1000000 '
    ],
    'paid_amount' => [
        'required' => ' الرجاء إدخال المبلغ المدفوع '
    ],

    'responsables' => [
        'required' => ' الرجاء إدخال الموظفين المسؤوولين '
    ],

    'invoice_items' => [
        'required' => ' يرجى تحديد بنود الفاتورة ',
        'item_id' => [
            'required' => ' يرجى تحديد البند ',
        ],
        'amount' => [
            'required' => 'يرجى إدخال المبلغ ',
            'numeric' => ' الرجاء إدخال المبلغ الصحيح',
            'max' => ' من فضلك ادخل كمية أقل من 1000000',
            'min' => ' يجب أن تكون قيمة الكمية مساوية أو أكبر من 1.',

        ],
        'purchase_price' => [
            'required' => ' الرجاء إدخال سعر الشراء ',
            'numeric' => 'الرجاء إدخال سعر الشراء الصحيح ',
            'max' => ' من فضلك ادخل سعر الشراء أقل من 1000000',

        ],
        'sale_price' => [
            'required' => 'الرجاء إدخال سعر البيع  ',
            'numeric' => ' الرجاء إدخال سعر البيع الصحيح  ',
            'max' => ' من فضلك ادخل سعر البيع أقل من 1000000',

        ],
    ],
    'message' => [
        'required' => 'يرجى إدخال الرسالة '
    ],
    'image_' => [
        'required' => ' الرجاء تحديد الصورة ',
        'image' => ' يرجى تحديد الملف الصحيح '
    ],
    'password_' => [
        'required' => ' من فضلك ادخل كلمة المرور  ',
        'confirmed' => ' من فضلك قم بتأكيد كلمة المرور '
    ],


    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */


    'accepted' => 'يجب قبول :attribute.',
    'active_url' => ':attribute لا يُمثّل رابطًا صحيحًا.',
    'after' => 'يجب على :attribute أن يكون تاريخًا لاحقًا للتاريخ :date.',
    'after_or_equal' => ':attribute يجب أن يكون تاريخاً لاحقاً أو مطابقاً للتاريخ :date.',
    'alpha' => 'يجب أن لا يحتوي :attribute سوى على حروف.',
    'alpha_dash' => 'يجب أن لا يحتوي :attribute سوى على حروف، أرقام ومطّات.',
    'alpha_num' => 'يجب أن يحتوي :attribute على حروفٍ وأرقامٍ فقط.',
    'array' => 'يجب أن يكون :attribute ًمصفوفة.',
    'before' => 'يجب على :attribute أن يكون تاريخًا سابقًا للتاريخ :date.',
    'before_or_equal' => ':attribute يجب أن يكون تاريخا سابقا أو مطابقا للتاريخ :date.',
    'between' => [
        'numeric' => 'يجب أن تكون قيمة :attribute بين :min و :max.',
        'file' => 'يجب أن يكون حجم الملف :attribute بين :min و :max كيلوبايت.',
        'string' => 'يجب أن يكون عدد حروف النّص :attribute بين :min و :max.',
        'array' => 'يجب أن يحتوي :attribute على عدد من العناصر بين :min و :max.',
    ],
    'boolean' => 'يجب أن تكون قيمة :attribute إما true أو false .',
    'confirmed' => 'حقل التأكيد غير مُطابق للحقل :attribute.',
    'date' => ':attribute ليس تاريخًا صحيحًا.',
    'date_equals' => 'يجب أن يكون :attribute مطابقاً للتاريخ :date.',
    'date_format' => 'لا يتوافق :attribute مع الشكل :format.',
    'different' => 'يجب أن يكون الحقلان :attribute و :other مُختلفين.',
    'digits' => 'يجب أن يحتوي :attribute على :digits رقمًا/أرقام.',
    'digits_between' => 'يجب أن يحتوي :attribute بين :min و :max رقمًا/أرقام .',
    'dimensions' => 'الـ :attribute يحتوي على أبعاد صورة غير صالحة.',
    'distinct' => 'للحقل :attribute قيمة مُكرّرة.',
    'email' => 'يجب أن يكون :attribute عنوان بريد إلكتروني صحيح البُنية.',
    'ends_with' => 'يجب أن ينتهي :attribute بأحد القيم التالية: :values',
    'exists' => 'القيمة المحددة :attribute غير موجودة.',
    'file' => 'الـ :attribute يجب أن يكون ملفا.',
    'filled' => ':attribute إجباري.',
    'gt' => [
        'numeric' => 'يجب أن تكون قيمة :attribute أكبر من :value.',
        'file' => 'يجب أن يكون حجم الملف :attribute أكبر من :value كيلوبايت.',
        'string' => 'يجب أن يكون طول النّص :attribute أكثر من :value حروفٍ/حرفًا.',
        'array' => 'يجب أن يحتوي :attribute على أكثر من :value عناصر/عنصر.',
    ],
    'gte' => [
        'numeric' => 'يجب أن تكون قيمة :attribute مساوية أو أكبر من :value.',
        'file' => 'يجب أن يكون حجم الملف :attribute على الأقل :value كيلوبايت.',
        'string' => 'يجب أن يكون طول النص :attribute على الأقل :value حروفٍ/حرفًا.',
        'array' => 'يجب أن يحتوي :attribute على الأقل على :value عُنصرًا/عناصر.',
    ],
    'image' => 'يجب أن يكون :attribute صورةً.',
    'in' => ':attribute غير موجود.',
    'in_array' => ':attribute غير موجود في :other.',
    'integer' => 'يجب أن يكون :attribute عددًا صحيحًا.',
    'ip' => 'يجب أن يكون :attribute عنوان IP صحيحًا.',
    'ipv4' => 'يجب أن يكون :attribute عنوان IPv4 صحيحًا.',
    'ipv6' => 'يجب أن يكون :attribute عنوان IPv6 صحيحًا.',
    'json' => 'يجب أن يكون :attribute نصًا من نوع JSON.',
    'lt' => [
        'numeric' => 'يجب أن تكون قيمة :attribute أصغر من :value.',
        'file' => 'يجب أن يكون حجم الملف :attribute أصغر من :value كيلوبايت.',
        'string' => 'يجب أن يكون طول النّص :attribute أقل من :value حروفٍ/حرفًا.',
        'array' => 'يجب أن يحتوي :attribute على أقل من :value عناصر/عنصر.',
    ],
    'lte' => [
        'numeric' => 'يجب أن تكون قيمة :attribute مساوية أو أصغر من :value.',
        'file' => 'يجب أن لا يتجاوز حجم الملف :attribute :value كيلوبايت.',
        'string' => 'يجب أن لا يتجاوز طول النّص :attribute :value حروفٍ/حرفًا.',
        'array' => 'يجب أن لا يحتوي :attribute على أكثر من :value عناصر/عنصر.',
    ],
    'max' => [
        'numeric' => 'يجب أن تكون قيمة :attribute مساوية أو أصغر من :max.',
        'file' => 'يجب أن لا يتجاوز حجم الملف :attribute :max كيلوبايت.',
        'string' => 'يجب أن لا يتجاوز طول النّص :attribute :max حروفٍ/حرفًا.',
        'array' => 'يجب أن لا يحتوي :attribute على أكثر من :max عناصر/عنصر.',
    ],
    'mimes' => 'يجب أن يكون ملفًا من نوع : :values.',
    'mimetypes' => 'يجب أن يكون ملفًا من نوع : :values.',
    'min' => [
        'numeric' => 'يجب أن تكون قيمة :attribute مساوية أو أكبر من :min.',
        'file' => 'يجب أن يكون حجم الملف :attribute على الأقل :min كيلوبايت.',
        'string' => 'يجب أن يكون طول النص :attribute على الأقل :min حروفٍ/حرفًا.',
        'array' => 'يجب أن يحتوي :attribute على الأقل على :min عُنصرًا/عناصر.',
    ],
    'not_in' => 'العنصر :attribute غير صحيح.',
    'not_regex' => 'صيغة :attribute غير صحيحة.',
    'numeric' => 'يجب على :attribute أن يكون رقمًا.',
    'password' => 'كلمة المرور غير صحيحة.',
    'present' => 'يجب تقديم :attribute.',
    'regex' => 'صيغة :attribute .غير صحيحة.',
    'required' => ':attribute مطلوب.',
    'required_if' => ':attribute مطلوب في حال ما إذا كان :other يساوي :value.',
    'required_unless' => ':attribute مطلوب في حال ما لم يكن :other يساوي :values.',
    'required_with' => ':attribute مطلوب إذا توفّر :values.',
    'required_with_all' => ':attribute مطلوب إذا توفّر :values.',
    'required_without' => ':attribute مطلوب إذا لم يتوفّر :values.',
    'required_without_all' => ':attribute مطلوب إذا لم يتوفّر :values.',
    'same' => 'يجب أن يتطابق :attribute مع :other.',
    'size' => [
        'numeric' => 'يجب أن تكون قيمة :attribute مساوية لـ :size.',
        'file' => 'يجب أن يكون حجم الملف :attribute :size كيلوبايت.',
        'string' => 'يجب أن يحتوي النص :attribute على :size حروفٍ/حرفًا بالضبط.',
        'array' => 'يجب أن يحتوي :attribute على :size عنصرٍ/عناصر بالضبط.',
    ],
    'starts_with' => 'يجب أن يبدأ :attribute بأحد القيم التالية: :values',
    'string' => 'يجب أن يكون :attribute نصًا.',
    'timezone' => 'يجب أن يكون :attribute نطاقًا زمنيًا صحيحًا.',
    'unique' => 'قيمة :attribute مُستخدمة من قبل.',
    'uploaded' => 'فشل في تحميل الـ :attribute.',
    'url' => 'صيغة الرابط :attribute غير صحيحة.',
    'uuid' => ':attribute يجب أن يكون بصيغة UUID سليمة.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */


    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */

    'attributes' => [
        'name' => 'الاسم',
        'username' => 'اسم المُستخدم',
        'email' => 'البريد الالكتروني',
        'first_name' => 'الاسم الأول',
        'last_name' => 'اسم العائلة',
        'password' => 'كلمة المرور',
        'password_confirmation' => 'تأكيد كلمة المرور',
        'city' => 'المدينة',
        'country' => 'الدولة',
        'address' => 'عنوان السكن',
        'phone' => 'الهاتف',
        'mobile' => 'الجوال',
        'age' => 'العمر',
        'sex' => 'الجنس',
        'gender' => 'النوع',
        'day' => 'اليوم',
        'month' => 'الشهر',
        'year' => 'السنة',
        'hour' => 'ساعة',
        'minute' => 'دقيقة',
        'second' => 'ثانية',
        'title' => 'العنوان',
        'content' => 'المُحتوى',
        'description' => 'الوصف',
        'excerpt' => 'المُلخص',
        'date' => 'التاريخ',
        'time' => 'الوقت',
        'available' => 'مُتاح',
        'size' => 'الحجم',
    ],

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [],

];

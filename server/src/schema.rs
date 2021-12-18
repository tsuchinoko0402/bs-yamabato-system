table! {
    accouting_report (accouting_id) {
        accouting_id -> Int4,
        meeting_id -> Int4,
        suspense_payments_breakdown -> Nullable<Varchar>,
        suspense_payments_deposit -> Nullable<Int4>,
        participation_fee_breakdown -> Nullable<Varchar>,
        participation_fee_deposit -> Nullable<Int4>,
        travel_expenses_breakdown -> Nullable<Varchar>,
        travel_expenses_withdraw -> Nullable<Int4>,
        venue_fee_breakdown -> Nullable<Varchar>,
        venue_fee_withdraw -> Nullable<Int4>,
        food_expenses_breakdown -> Nullable<Varchar>,
        food_expenses_withdraw -> Nullable<Int4>,
        program_fee_breakdown -> Nullable<Varchar>,
        program_fee_withdraw -> Nullable<Int4>,
        others_name -> Nullable<Varchar>,
        others_breakdown -> Nullable<Varchar>,
        others_deposit -> Nullable<Int4>,
        others_withdraw -> Nullable<Int4>,
        supplies_cost_breakdown -> Nullable<Varchar>,
        supplies_cost_deposit -> Nullable<Int4>,
        supplies_cost_withdraw -> Nullable<Int4>,
        create_time -> Nullable<Timestamp>,
        update_time -> Nullable<Timestamp>,
    }
}

table! {
    commission_travel_expense (id) {
        id -> Int4,
        applicant_name -> Nullable<Varchar>,
        commission_name -> Nullable<Varchar>,
        place -> Nullable<Varchar>,
        date -> Nullable<Date>,
        transportation -> Nullable<Varchar>,
        depature -> Nullable<Varchar>,
        arrival -> Nullable<Varchar>,
        is_round_trip -> Nullable<Bool>,
        amount -> Nullable<Int4>,
    }
}

table! {
    customer (name) {
        name -> Text,
        age -> Nullable<Int4>,
        reg_date -> Date,
    }
}

table! {
    group_meeting_report (meeting_id) {
        meeting_id -> Int4,
        input_user_id -> Nullable<Varchar>,
        group -> Varchar,
        start_date -> Date,
        start_time -> Time,
        end_date -> Nullable<Date>,
        end_time -> Nullable<Time>,
        place -> Varchar,
        participants_scout_ids -> Array<Text>,
        number_of_leaders -> Nullable<Int4>,
        number_of_guardians -> Nullable<Int4>,
        number_of_experienced_children -> Nullable<Int4>,
        number_of_experienced_guardian -> Nullable<Int4>,
        details -> Nullable<Varchar>,
        create_time -> Nullable<Timestamp>,
        update_time -> Nullable<Timestamp>,
    }
}

joinable!(accouting_report -> group_meeting_report (meeting_id));

allow_tables_to_appear_in_same_query!(
    accouting_report,
    commission_travel_expense,
    customer,
    group_meeting_report,
);

CREATE TABLE public.commission_travel_expense (
	id serial4 NOT NULL, -- 申請ID
	applicant_name varchar NULL, -- 申請者名
	commission_name varchar NULL, -- 委員会名
	place varchar NULL, -- 開催場所
	"date" date NULL, -- 開催日
	transportation varchar NULL, -- 交通機関名
	depature varchar NULL, -- 出発駅名
	arrival varchar NULL, -- 到着駅名
	is_round_trip bool NULL, -- 往復か否か
	amount int4 NULL, -- 金額
	CONSTRAINT commission_travel_expense_pk PRIMARY KEY (id)
);
COMMENT ON TABLE public.commission_travel_expense IS '委員会交通費申請のテーブル';

COMMENT ON COLUMN public.commission_travel_expense.id IS '申請ID';
COMMENT ON COLUMN public.commission_travel_expense.applicant_name IS '申請者名';
COMMENT ON COLUMN public.commission_travel_expense.commission_name IS '委員会名';
COMMENT ON COLUMN public.commission_travel_expense.place IS '開催場所';
COMMENT ON COLUMN public.commission_travel_expense."date" IS '開催日';
COMMENT ON COLUMN public.commission_travel_expense.transportation IS '交通機関名';
COMMENT ON COLUMN public.commission_travel_expense.depature IS '出発駅名';
COMMENT ON COLUMN public.commission_travel_expense.arrival IS '到着駅名';
COMMENT ON COLUMN public.commission_travel_expense.is_round_trip IS '往復か否か';
COMMENT ON COLUMN public.commission_travel_expense.amount IS '金額';

CREATE TABLE public.group_meeting_report (
	meeting_id serial NOT NULL, -- 集会ID
	input_user_id varchar NULL, -- 入力者ID
	"group" varchar NOT NULL, -- 集会実施隊名
	start_date date NOT NULL, -- 集会開始日
	start_time time NOT NULL, -- 集会開始時刻
	end_date date NULL, -- 集会終了日
	end_time time NULL, -- 集会終了時刻
	place varchar NOT NULL, -- 集会実施場所
	participants_scout_ids _text NOT NULL, -- スカウトの集会参加者ID一覧
	number_of_leaders int4 NULL, -- 指導者の参加者数
	number_of_guardians int4 NULL, -- 保護者の参加者数
	number_of_experienced_children int4 NULL, -- 体験者の子供の参加者数
	number_of_experienced_guardian int4 NULL, -- 体験者の保護者の参加者数
	details varchar NULL, -- 集会内容・評価反省
	create_time timestamp NULL, -- データ作成日時
	update_time timestamp NULL, -- データ更新日時
	CONSTRAINT reported_group_meeting_pk PRIMARY KEY (meeting_id)
);
COMMENT ON TABLE public.group_meeting_report IS '集会報告のためのテーブル';

COMMENT ON COLUMN public.group_meeting_report.meeting_id IS '集会ID';
COMMENT ON COLUMN public.group_meeting_report."group" IS '集会実施隊名';
COMMENT ON COLUMN public.group_meeting_report.start_date IS '集会開始日';
COMMENT ON COLUMN public.group_meeting_report.participants_scout_ids IS 'スカウトの集会参加者ID一覧';
COMMENT ON COLUMN public.group_meeting_report.details IS '集会内容・評価反省';
COMMENT ON COLUMN public.group_meeting_report.number_of_leaders IS '指導者の参加者数';
COMMENT ON COLUMN public.group_meeting_report.number_of_guardians IS '保護者の参加者数';
COMMENT ON COLUMN public.group_meeting_report.place IS '集会実施場所';
COMMENT ON COLUMN public.group_meeting_report.number_of_experienced_children IS '体験者の子供の参加者数';
COMMENT ON COLUMN public.group_meeting_report.number_of_experienced_guardian IS '体験者の保護者の参加者数';
COMMENT ON COLUMN public.group_meeting_report.start_time IS '集会開始時刻';
COMMENT ON COLUMN public.group_meeting_report.end_date IS '集会終了日';
COMMENT ON COLUMN public.group_meeting_report.end_time IS '集会終了時刻';
COMMENT ON COLUMN public.group_meeting_report.input_user_id IS '入力者ID';
COMMENT ON COLUMN public.group_meeting_report.create_time IS 'データ作成日時';
COMMENT ON COLUMN public.group_meeting_report.update_time IS 'データ更新日時';

CREATE TABLE public.accouting_report (
	accouting_id serial NOT NULL, -- 出納報告ID
	meeting_id integer NOT NULL, -- 集会ID
	suspense_payments_breakdown varchar NULL, -- 仮払金の内訳
	suspense_payments_deposit int4 NULL, -- 仮払金の入金額
	participation_fee_breakdown varchar NULL, -- 参加費の内訳
	participation_fee_deposit int4 NULL, -- 参加費の入金額
	travel_expenses_breakdown varchar NULL, -- 交通費の内訳
	travel_expenses_withdraw int4 NULL, -- 交通費の出金額
	venue_fee_breakdown varchar NULL, -- 会場費の内訳
	venue_fee_withdraw int4 NULL, -- 会場費の出金額
	food_expenses_breakdown varchar NULL, -- 食費の内訳
	food_expenses_withdraw int4 NULL, -- 食費の出金額
	program_fee_breakdown varchar NULL, -- プログラム費の内訳
	program_fee_withdraw int4 NULL, -- プログラム費の出金額
	others_name varchar NULL, -- 「その他」の項目名
	others_breakdown varchar NULL, -- 「その他」の内訳
	others_deposit int4 NULL, -- 「その他」の入金額
	others_withdraw int4 NULL, -- 「その他」の出金額
	supplies_cost_breakdown varchar NULL, -- 需品代の内訳
	supplies_cost_deposit int4 NULL, -- 需品代の入金額
	supplies_cost_withdraw int4 NULL, -- 需品代の出金額
	create_time timestamp NULL, -- データ作成日時
	update_time timestamp NULL, -- データ更新日時
	CONSTRAINT accouting_id_meeting_pk PRIMARY KEY (accouting_id)
);
COMMENT ON TABLE public.accouting_report IS '集会報告のためのテーブル';

ALTER TABLE public.accouting_report ADD CONSTRAINT accouting_report_fk FOREIGN KEY (meeting_id) REFERENCES public.group_meeting_report(meeting_id);

COMMENT ON COLUMN public.accouting_report.accouting_id IS '出納報告ID';
COMMENT ON COLUMN public.accouting_report.meeting_id IS '集会ID';
COMMENT ON COLUMN public.accouting_report.suspense_payments_breakdown IS '仮払金の内訳';
COMMENT ON COLUMN public.accouting_report.suspense_payments_deposit IS '仮払金の入金額';
COMMENT ON COLUMN public.accouting_report.participation_fee_breakdown IS '参加費の内訳';
COMMENT ON COLUMN public.accouting_report.participation_fee_deposit IS '参加費の入金額';
COMMENT ON COLUMN public.accouting_report.travel_expenses_breakdown IS '交通費の内訳';
COMMENT ON COLUMN public.accouting_report.travel_expenses_withdraw IS '交通費の出金額';
COMMENT ON COLUMN public.accouting_report.venue_fee_breakdown IS '会場費の内訳';
COMMENT ON COLUMN public.accouting_report.venue_fee_withdraw IS '会場費の出金額';
COMMENT ON COLUMN public.accouting_report.food_expenses_breakdown IS '食費の内訳';
COMMENT ON COLUMN public.accouting_report.food_expenses_withdraw IS '食費の出金額';
COMMENT ON COLUMN public.accouting_report.program_fee_breakdown IS 'プログラム費の内訳';
COMMENT ON COLUMN public.accouting_report.program_fee_withdraw IS 'プログラム費の出金額';
COMMENT ON COLUMN public.accouting_report.others_name IS '「その他」の項目名';
COMMENT ON COLUMN public.accouting_report.others_breakdown IS '「その他」の内訳';
COMMENT ON COLUMN public.accouting_report.others_deposit IS '「その他」の入金額';
COMMENT ON COLUMN public.accouting_report.others_withdraw IS '「その他」の出金額';
COMMENT ON COLUMN public.accouting_report.supplies_cost_breakdown IS '需品代の内訳';
COMMENT ON COLUMN public.accouting_report.supplies_cost_deposit IS '需品代の入金額';
COMMENT ON COLUMN public.accouting_report.supplies_cost_withdraw IS '需品代の出金額';

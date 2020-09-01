declare
      num   number;
begin
select count(1) into num  from user_tables where table_name = upper('his_eng_order') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_cost') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_cost' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_infection') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_infection' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_drug') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_drug' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_drug_execute') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_drug_execute' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_drug_send') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_drug_send' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_fee_detail') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_fee_detail' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_diagnose') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_diagnose' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_operation') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_operation' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_order_exam') ;
   if num > 0 then
          execute immediate 'drop table his_eng_order_exam' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_register') ;
   if num > 0 then
          execute immediate 'drop table his_register' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_cf') ;
   if num > 0 then
          execute immediate 'drop table his_eng_cf' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_cf_item') ;
   if num > 0 then
          execute immediate 'drop table his_eng_cf_item' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_cf_item_fee') ;
   if num > 0 then
          execute immediate 'drop table his_eng_cf_item_fee' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_eng_cf_drug_send') ;
   if num > 0 then
          execute immediate 'drop table his_eng_cf_drug_send' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_drug_catalog') ;
   if num > 0 then
          execute immediate 'drop table his_drug_catalog' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_drug_convert') ;
   if num > 0 then
          execute immediate 'drop table his_drug_convert' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_department') ;
   if num > 0 then
          execute immediate 'drop table his_department' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_doctor') ;
   if num > 0 then
          execute immediate 'drop table his_doctor' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_admin_route') ;
   if num > 0 then
          execute immediate 'drop table his_admin_route' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_admin_frequency') ;
   if num > 0 then
          execute immediate 'drop table his_admin_frequency' ;
      end if;

select count(1) into num  from user_tables where table_name = upper('his_allergy') ;
   if num > 0 then
          execute immediate 'drop table his_allergy' ;
      end if;
end;  

/

-- his_eng_order
create table his_eng_order
(
  id                NUMBER(20) not null,
  creator           NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  order_id          NVARCHAR2(60),
  sex               NVARCHAR2(20),
  pay_type          NVARCHAR2(290),
  patient_no        NVARCHAR2(90),
  ssid              NVARCHAR2(100),
  name              NVARCHAR2(100),
  address           NVARCHAR2(400),
  phone_no          NVARCHAR2(120),
  id_card           NVARCHAR2(80),
  height            NVARCHAR2(40),
  weight            NVARCHAR2(40),
  birth_weight      NVARCHAR2(40),
  allergy_list      NVARCHAR2(200),
  pregnancy         NVARCHAR2(20),
  time_of_preg      NUMBER(10),
  breast_feeding    NVARCHAR2(20),
  birthday          NVARCHAR2(90),
  marital          NVARCHAR2(90),
  occpation         NVARCHAR2(90),
  natonality        NVARCHAR2(90),
  entry_time        NUMBER(10),
  in_date           NVARCHAR2(90),
  in_depart_id      NVARCHAR2(100),
  in_department     NVARCHAR2(90),
  in_area           NVARCHAR2(400),
  out_date          NVARCHAR2(90),
  out_depart_id     NVARCHAR2(100),
  out_department    NVARCHAR2(90),  
  doc_group         NVARCHAR2(90),
  dept_group        NVARCHAR2(400),
  out_area          NVARCHAR2(400)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the columns 
comment on table his_eng_order is '住院记录信息';
comment on column his_eng_order.org_code is '*医院机构代码';
comment on column his_eng_order.order_id is '*住院ID';
comment on column his_eng_order.sex is '性别';
comment on column his_eng_order.pay_type is '费用类型 ';
comment on column his_eng_order.patient_no is '病人ID';
comment on column his_eng_order.ssid is '*社保卡号';
comment on column his_eng_order.name is '病人姓名';
comment on column his_eng_order.address is '病人地址';
comment on column his_eng_order.phone_no is '病人电话';
comment on column his_eng_order.id_card is '病人身份证号';
comment on column his_eng_order.height is '身高';
comment on column his_eng_order.weight is '体重';
comment on column his_eng_order.birth_weight is '出身时体重';
comment on column his_eng_order.allergy_list is '过敏药物列表';
comment on column his_eng_order.pregnancy is '是否怀孕';
comment on column his_eng_order.time_of_preg is '孕期(周)';
comment on column his_eng_order.breast_feeding is '是否哺乳';
comment on column his_eng_order.birthday is '出生日期';
comment on column his_eng_order.marital is '婚姻状态';
comment on column his_eng_order.occpation is '职业';
comment on column his_eng_order.natonality is '民族';
comment on column his_eng_order.entry_time is '住院次数';
comment on column his_eng_order.in_date is '入院时间';
comment on column his_eng_order.in_depart_id is '入院科室ID';
comment on column his_eng_order.in_department is '入院科室名称';
comment on column his_eng_order.in_area is '入院病区名称';
comment on column his_eng_order.out_date is '出院时间';
comment on column his_eng_order.out_depart_id is '出院科室ID';
comment on column his_eng_order.out_department is '出院科室名称';
comment on column his_eng_order.doc_group is '出院医疗组名称';
comment on column his_eng_order.dept_group is '出院科室分类名称';
comment on column his_eng_order.out_area is '出院病区名称';
-- Create/Recreate primary, unique and foreign key constraints 
alter table his_eng_order
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EO_CREATE_TIME on his_eng_order (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EO_CREATE_ORDER_ID on his_eng_order (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EO_modify_time on his_eng_order (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_cost
create table his_eng_order_cost
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  order_id          NVARCHAR2(60),
  bed_fee           NUMBER(20,4),
  nurse_fee         NUMBER(20,4),
  wm_fee            NUMBER(20,4),
  cpd_fee           NUMBER(20,4),
  cmh_fee           NUMBER(20,4),
  radio_fee         NUMBER(20,4),
  exam_fee          NUMBER(20,4),
  oxy_fee           NUMBER(20,4),
  blood_fee         NUMBER(20,4),
  operation_fee     NUMBER(20,4),
  check_fee         NUMBER(20,4),
  anesth_fee        NUMBER(20,4),
  treat_fee         NUMBER(20,4),
  other_fee         NUMBER(20,4),
  total_fee         NUMBER(20,4)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table his_eng_order_cost is '住院患者费用结算表';
comment on column his_eng_order_cost.id is '主键';
comment on column his_eng_order_cost.creator is '创建人';
comment on column his_eng_order_cost.create_time is '创建时间';
comment on column his_eng_order_cost.modifier is '修改人';
comment on column his_eng_order_cost.modify_time is '修改时间';
comment on column his_eng_order_cost.org_code is '*机构代码';
comment on column his_eng_order_cost.order_id is '住院ID';
comment on column his_eng_order_cost.bed_fee is '床位费(元)';
comment on column his_eng_order_cost.nurse_fee is '护理费(元)';
comment on column his_eng_order_cost.wm_fee is '西药费(元)';
comment on column his_eng_order_cost.cpd_fee is '中成药费(元)';
comment on column his_eng_order_cost.cmh_fee is '中草药费(元)';
comment on column his_eng_order_cost.radio_fee is '放射费(元)';
comment on column his_eng_order_cost.exam_fee is '化验费(元)';
comment on column his_eng_order_cost.oxy_fee is '输氧费(元)';
comment on column his_eng_order_cost.blood_fee is '输血费(元)';
comment on column his_eng_order_cost.operation_fee is '手术费(元)';
comment on column his_eng_order_cost.check_fee is '检查费(元)';
comment on column his_eng_order_cost.anesth_fee is '麻醉费(元)';
comment on column his_eng_order_cost.treat_fee is '治疗费(元)';
comment on column his_eng_order_cost.other_fee is '其他费用(元)';
comment on column his_eng_order_cost.total_fee is '住院费用总计(元)';
alter table his_eng_order_cost
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOC_PRES_DATE_TIME on his_eng_order_cost (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOC_PRES_ORDER_ID on his_eng_order_cost (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOC_modify_time on his_eng_order_cost (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_infection
create table his_eng_order_infection
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  order_id          NVARCHAR2(60),
  hi_code           NVARCHAR2(60),
  hi_name           NVARCHAR2(60),
  hi_out_come       NVARCHAR2(60),
  rescue_times      NVARCHAR2(60),
  rescue_succ_times NVARCHAR2(60),
  pathologic_diag   NVARCHAR2(60),
  pathologic_name   NVARCHAR2(60)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table his_eng_order_infection is '住院患者感染及病理信息';
comment on column his_eng_order_infection.id is '主键';
comment on column his_eng_order_infection.creator is '创建人';
comment on column his_eng_order_infection.create_time is '创建时间';
comment on column his_eng_order_infection.modifier is '修改人';
comment on column his_eng_order_infection.modify_time is '修改时间';
comment on column his_eng_order_infection.org_code is '*机构代码';
comment on column his_eng_order_infection.order_id is '住院ID';
comment on column his_eng_order_infection.hi_code is '医院感染代码';
comment on column his_eng_order_infection.hi_name is '医院感染名称';
comment on column his_eng_order_infection.hi_out_come is '医院感染治疗结果';
comment on column his_eng_order_infection.rescue_times is '抢救次数';
comment on column his_eng_order_infection.rescue_succ_times is '抢救成功次数';
comment on column his_eng_order_infection.pathologic_diag is '病理诊断';
comment on column his_eng_order_infection.pathologic_name is '病理名称';
alter table his_eng_order_infection
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOI_PRES_DATE_TIME on his_eng_order_infection (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOI_PRES_ORDER_ID on his_eng_order_infection (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOI_modify_time on his_eng_order_infection (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_drug
create table his_eng_order_drug
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  item_id           NVARCHAR2(90),
  org_code          NVARCHAR2(100),
  order_id          NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  patient_name      NVARCHAR2(90),
  type              NVARCHAR2(90),
  start_time        NVARCHAR2(90),
  end_time          NVARCHAR2(90),
  continue_day      NVARCHAR2(90),
  pres_date_time    NVARCHAR2(90),  
  group_no          NVARCHAR2(90),
  drug_id           NVARCHAR2(90),
  drug_name         NVARCHAR2(90),
  prep_form         NVARCHAR2(90),
  spec_name         NVARCHAR2(400),  
  reg_name          NVARCHAR2(600),
  manufacturer_name NVARCHAR2(200),
  admin_route       NVARCHAR2(90),
  admin_dose        NVARCHAR2(90),
  admin_dose_unit   NVARCHAR2(90),
  admin_frequency   NVARCHAR2(90),
  admin_method      NVARCHAR2(90),
  admin_goal        NVARCHAR2(90),
  comments          NVARCHAR2(90),
  doc_id            NVARCHAR2(90),
  doc_name          NVARCHAR2(90),
  doc_title         NVARCHAR2(90),
  pres_depart_id    NVARCHAR2(90),
  pres_department   NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_order_drug is '住院药嘱（医嘱的药品部分）开具数据';
comment on column his_eng_order_drug.id is '主键';
comment on column his_eng_order_drug.creator is '创建人';
comment on column his_eng_order_drug.create_time is '创建时间';
comment on column his_eng_order_drug.modifier is '修改人';
comment on column his_eng_order_drug.modify_time is '修改时间';
comment on column his_eng_order_drug.item_id is '*医嘱ID';
comment on column his_eng_order_drug.order_id is '住院ID'; 
comment on column his_eng_order_drug.org_code is '*机构代码';
comment on column his_eng_order_drug.patient_no is '*病人ID';
comment on column his_eng_order_drug.patient_name is '病人姓名';
comment on column his_eng_order_drug.type is '医嘱类型';
comment on column his_eng_order_drug.start_time is '药嘱开始时间';
comment on column his_eng_order_drug.end_time is '药嘱结束时间';
comment on column his_eng_order_drug.continue_day is '用药持续时间（天）';
comment on column his_eng_order_drug.pres_date_time is '开具时间';
comment on column his_eng_order_drug.group_no is '组号';
comment on column his_eng_order_drug.drug_id is '药品id';
comment on column his_eng_order_drug.drug_name is '医院药品名称';
comment on column his_eng_order_drug.prep_form is '剂型';
comment on column his_eng_order_drug.spec_name is '规格';
comment on column his_eng_order_drug.reg_name is '商品名';
comment on column his_eng_order_drug.manufacturer_name is '药品生产厂家';
comment on column his_eng_order_drug.admin_route is '给药途径';
comment on column his_eng_order_drug.admin_dose is '单次给药剂量';
comment on column his_eng_order_drug.admin_dose_unit is '*单次给药剂量单位';
comment on column his_eng_order_drug.admin_frequency is '给药频率';
comment on column his_eng_order_drug.admin_method is '给药时机';
comment on column his_eng_order_drug.admin_goal is '用药目的';
comment on column his_eng_order_drug.comments is '*医嘱备注';
comment on column his_eng_order_drug.doc_id is '医师工号';
comment on column his_eng_order_drug.doc_name is '医师姓名';
comment on column his_eng_order_drug.doc_title is '医师职称';
comment on column his_eng_order_drug.pres_depart_id is '开具科室ID';
comment on column his_eng_order_drug.pres_department is '开具科室名称'; 
alter table his_eng_order_drug
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOD_PRES_DATE_TIME on his_eng_order_drug (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOD_ITEM_ID on his_eng_order_drug (item_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOD_ORDER_ID on his_eng_order_drug (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOD_DRUG_DRUG_ID on his_eng_order_drug (DRUG_ID)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOD_DRUG_ORG_CODE on his_eng_order_drug (org_code)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOD_modify_time on his_eng_order_drug (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;


-- his_eng_order_drug_execute
create table his_eng_order_drug_execute
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  item_exec_id      NVARCHAR2(90),
  order_id          NVARCHAR2(90),
  item_id           NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  patient_name      NVARCHAR2(90),
  type              NVARCHAR2(90),
  group_no          NVARCHAR2(90),
  drug_id           NVARCHAR2(90),
  drug_name         NVARCHAR2(90),
  prep_form         NVARCHAR2(90),
  spec_name         NVARCHAR2(400), 
  manufacturer_name NVARCHAR2(200), 
  admin_route       NVARCHAR2(90),
  admin_dose        NVARCHAR2(90),
  admin_dose_unit   NVARCHAR2(90),
  admin_frequency   NVARCHAR2(90),
  admin_method      NVARCHAR2(90),
  admin_goal        NVARCHAR2(90),
  doc_id            NVARCHAR2(90),
  doc_name          NVARCHAR2(90),
  execute_time      DATE,
  execute_depart_id NVARCHAR2(90),
  execute_department  NVARCHAR2(90),
  pharm_chk_id      NVARCHAR2(90),
  pharm_chk_name    NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_order_drug_execute is '住院药嘱（医嘱的药品部分）执行数据';
comment on column his_eng_order_drug_execute.id is '主键';
comment on column his_eng_order_drug_execute.creator is '创建人';
comment on column his_eng_order_drug_execute.create_time is '创建时间';
comment on column his_eng_order_drug_execute.modifier is '修改人';
comment on column his_eng_order_drug_execute.modify_time is '修改时间';
comment on column his_eng_order_drug_execute.org_code is '*机构编码';
comment on column his_eng_order_drug_execute.item_exec_id is '*医嘱执行ID';
comment on column his_eng_order_drug_execute.order_id is '住院ID';
comment on column his_eng_order_drug_execute.item_id is '医嘱ID';
comment on column his_eng_order_drug_execute.patient_no is '病人ID';
comment on column his_eng_order_drug_execute.patient_name is '病人姓名';
comment on column his_eng_order_drug_execute.type is '医嘱类型';
comment on column his_eng_order_drug_execute.group_no is '组号';
comment on column his_eng_order_drug_execute.drug_id is '药品id';
comment on column his_eng_order_drug_execute.drug_name is '医院药品名称';
comment on column his_eng_order_drug_execute.prep_form is '剂型';
comment on column his_eng_order_drug_execute.spec_name is '规格';
comment on column his_eng_order_drug_execute.manufacturer_name is '厂家';
comment on column his_eng_order_drug_execute.admin_route is '给药途径';
comment on column his_eng_order_drug_execute.admin_dose is '执行剂量数量';
comment on column his_eng_order_drug_execute.admin_dose_unit is '执行剂量单位';
comment on column his_eng_order_drug_execute.admin_frequency is '给药频率';
comment on column his_eng_order_drug_execute.admin_method is '给药方式';
comment on column his_eng_order_drug_execute.admin_goal is '给药目的';
comment on column his_eng_order_drug_execute.doc_id is '医师工号';
comment on column his_eng_order_drug_execute.doc_name is '医师姓名';
comment on column his_eng_order_drug_execute.execute_time is '执行时间';
comment on column his_eng_order_drug_execute.execute_depart_id is '*执行科室ID';
comment on column his_eng_order_drug_execute.execute_department is '执行科室名称';
comment on column his_eng_order_drug_execute.pharm_chk_id is '*审核药师工号';
comment on column his_eng_order_drug_execute.pharm_chk_name is '*审核药师姓名';
alter table his_eng_order_drug_execute
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODE_DATE_TIME on his_eng_order_drug_execute (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODE_ITEM_ID on his_eng_order_drug_execute (item_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;  
create index EODE_DRUG_ID on his_eng_order_drug_execute (DRUG_ID)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODE_ORDER_ID on his_eng_order_drug_execute (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODE_modify_time on his_eng_order_drug_execute (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_drug_send
create table his_eng_order_drug_send
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  item_send_id      NVARCHAR2(90),
  dispense_store    NVARCHAR2(90),
  order_id          NVARCHAR2(90),
  item_id           NVARCHAR2(90),
  type              NVARCHAR2(90),
  group_no          NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  patient_name      NVARCHAR2(90),
  drug_id           NVARCHAR2(90),
  drug_name         NVARCHAR2(90),
  prep_form         NVARCHAR2(90),
  spec_name         NVARCHAR2(400), 
  manufacturer_name NVARCHAR2(200),
  qty               NUMBER(20,4),
  qty_unit          NVARCHAR2(90),
  send_dose         NVARCHAR2(90),
  send_unit         NVARCHAR2(90),
  send_date_time    NVARCHAR2(90),
  reduce_flag       NVARCHAR2(90),
  unit_price        NUMBER(20,4),
  amount            NUMBER(20,4),
  doc_id            NVARCHAR2(90),
  doc_name          NVARCHAR2(90),
  pharm_pre_id      NVARCHAR2(90),
  pharm_pre_name    NVARCHAR2(90),
  pharm_chk_id      NVARCHAR2(90),
  pharm_chk_name    NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_order_drug_send is '住院医嘱（医嘱的药品部分）发药数据';
comment on column his_eng_order_drug_send.id is '主键';
comment on column his_eng_order_drug_send.creator is '创建人';
comment on column his_eng_order_drug_send.create_time is '创建时间';
comment on column his_eng_order_drug_send.modifier is '修改人';
comment on column his_eng_order_drug_send.modify_time is '修改时间';
comment on column his_eng_order_drug_send.org_code is '*机构编码';
comment on column his_eng_order_drug_send.item_send_id is '行的唯一标识';
comment on column his_eng_order_drug_send.dispense_store is '发药药房名称';
comment on column his_eng_order_drug_send.order_id is '住院ID';
comment on column his_eng_order_drug_send.item_id is '*医嘱ID';
comment on column his_eng_order_drug_send.type is '医嘱类型';
comment on column his_eng_order_drug_send.group_no is '组号';
comment on column his_eng_order_drug_send.patient_no is '病人ID';
comment on column his_eng_order_drug_send.patient_name is '病人姓名';
comment on column his_eng_order_drug_send.drug_id is '药品id';
comment on column his_eng_order_drug_send.drug_name is '医院药品名称';
comment on column his_eng_order_drug_send.prep_form is '剂型';
comment on column his_eng_order_drug_send.spec_name is '规格';
comment on column his_eng_order_drug_send.manufacturer_name is '厂家';
comment on column his_eng_order_drug_send.qty is '发/退药数量';
comment on column his_eng_order_drug_send.qty_unit is '发/退药数量单位';
comment on column his_eng_order_drug_send.send_dose is '发/退药剂量';
comment on column his_eng_order_drug_send.send_unit is '发/退药剂量单位';
comment on column his_eng_order_drug_send.send_date_time is '发/退药时间';
comment on column his_eng_order_drug_send.reduce_flag is '*退药标识';
comment on column his_eng_order_drug_send.unit_price is '单价';
comment on column his_eng_order_drug_send.amount is '金额';
comment on column his_eng_order_drug_send.doc_id is '医师工号';
comment on column his_eng_order_drug_send.doc_name is '医师姓名';
comment on column his_eng_order_drug_send.pharm_pre_id is '*调剂药师工号';
comment on column his_eng_order_drug_send.pharm_pre_name is '*调剂药师姓名';
comment on column his_eng_order_drug_send.pharm_chk_id is '*审核药师工号';
comment on column his_eng_order_drug_send.pharm_chk_name is '*审核药师姓名';
alter table his_eng_order_drug_send
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODS_DATE_TIME on his_eng_order_drug_send (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODS_DATE_TIME_ID on his_eng_order_drug_send (item_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODS_ORDER_ID on his_eng_order_drug_send (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODS_DRUG_ID on his_eng_order_drug_send (DRUG_ID)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODS_ITEM_SEND_ID on his_eng_order_drug_send (item_send_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODS_modify_time on his_eng_order_drug_send (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_fee_detail
create table his_eng_order_fee_detail
(
  id                NUMBER(20) not null,
  creator           NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  cost_id           NVARCHAR2(90),
  pay_flag          NVARCHAR2(10),
  order_id          NVARCHAR2(90),
  order_item_id     NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  patient_name      NVARCHAR2(90),
  charge_time       DATE,
  item_type         NVARCHAR2(200),
  item_code         NVARCHAR2(90),
  item_name         NVARCHAR2(90),
  item_qty          NUMBER(20,4),
  item_qty_unit     NVARCHAR2(90),
  item_unit_price   NUMBER(20,4),
  item_amount       NUMBER(20,4),
  doc_id            NVARCHAR2(90),
  doc_name          NVARCHAR2(90),
  depart_id         NVARCHAR2(90),
  department        NVARCHAR2(90),
  execute_depart_id NVARCHAR2(90),
  execute_department NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_order_fee_detail is '住院收费明细数据';
comment on column his_eng_order_fee_detail.id is '主键';
comment on column his_eng_order_fee_detail.creator is '创建人';
comment on column his_eng_order_fee_detail.create_time is '创建时间';
comment on column his_eng_order_fee_detail.modifier is '修改人';
comment on column his_eng_order_fee_detail.modify_time is '修改时间';
comment on column his_eng_order_fee_detail.org_code is '*机构编码';
comment on column his_eng_order_fee_detail.cost_id is '*收费明细ID';
comment on column his_eng_order_fee_detail.pay_flag is '退费标志';
comment on column his_eng_order_fee_detail.order_id is '住院ID';
comment on column his_eng_order_fee_detail.order_item_id is '医嘱ID';
comment on column his_eng_order_fee_detail.patient_no is '病人ID';
comment on column his_eng_order_fee_detail.patient_name is '病人姓名';
comment on column his_eng_order_fee_detail.charge_time is '收费/退费时间';
comment on column his_eng_order_fee_detail.item_type is '项目费用类别';
comment on column his_eng_order_fee_detail.item_code is '项目编码';
comment on column his_eng_order_fee_detail.item_name is '项目名称';
comment on column his_eng_order_fee_detail.item_qty is '项目数量';
comment on column his_eng_order_fee_detail.item_qty_unit is '项目单位';
comment on column his_eng_order_fee_detail.item_unit_price is '项目单价';
comment on column his_eng_order_fee_detail.item_amount is '项目金额';
comment on column his_eng_order_fee_detail.doc_id is '开单医生ID';
comment on column his_eng_order_fee_detail.doc_name is '开单医生姓名';
comment on column his_eng_order_fee_detail.depart_id is '开单科室ID';
comment on column his_eng_order_fee_detail.department is '开单科室名称';
comment on column his_eng_order_fee_detail.execute_depart_id is '执行科室ID';
comment on column his_eng_order_fee_detail.execute_department is '执行科室名称';
alter table his_eng_order_fee_detail
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOFD_DATE_TIME on his_eng_order_fee_detail (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOFD_COST_ID on his_eng_order_fee_detail (cost_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOFD_ORDER_ID on his_eng_order_fee_detail (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;  
create index EOFD_org_code on his_eng_order_fee_detail (org_code)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255; 
create index EOFD_ORDER_ITEM_ID on his_eng_order_fee_detail (order_item_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOFD_modify_time on his_eng_order_fee_detail (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_diagnose
create table his_eng_order_diagnose
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  order_id          NVARCHAR2(90),
  diag_date         NVARCHAR2(90),
  diag_name         NVARCHAR2(400),
  diag_type         NVARCHAR2(90),
  dscharge_type     NVARCHAR2(90),
  icd10             NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table his_eng_order_diagnose is '住院患者诊断数据';
-- Add comments to the columns 
comment on column his_eng_order_diagnose.id is '主键';
comment on column his_eng_order_diagnose.creator is '创建人';
comment on column his_eng_order_diagnose.create_time is '创建时间';
comment on column his_eng_order_diagnose.modifier is '修改人';
comment on column his_eng_order_diagnose.modify_time is '修改时间';
comment on column his_eng_order_diagnose.org_code is '*机构编码';
comment on column his_eng_order_diagnose.order_id is '住院ID';
comment on column his_eng_order_diagnose.diag_date is '诊断时间';
comment on column his_eng_order_diagnose.diag_name is '诊断名称';
comment on column his_eng_order_diagnose.diag_type is '诊断类别';
comment on column his_eng_order_diagnose.dscharge_type is '出院情况';
comment on column his_eng_order_diagnose.icd10 is 'ICD10编码';
alter table his_eng_order_diagnose
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODI_DATE_TIME on his_eng_order_diagnose (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODI_ORDER_ID on his_eng_order_diagnose (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODI_ORG_CODE on his_eng_order_diagnose (org_code)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EODI_modify_time on his_eng_order_diagnose (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_operation
create table his_eng_order_operation
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  order_id          NVARCHAR2(90),
  code              NVARCHAR2(90),
  name              NVARCHAR2(400),
  start_time        NVARCHAR2(90),
  end_time          NVARCHAR2(90),
  incision_type     NVARCHAR2(90),
  incision_status   NVARCHAR2(90),
  inplant           NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table his_eng_order_operation is '手术医嘱 ';
-- Add comments to the columns 
comment on column his_eng_order_operation.id is '主键';
comment on column his_eng_order_operation.creator is '创建人';
comment on column his_eng_order_operation.create_time is '创建时间';
comment on column his_eng_order_operation.modifier is '修改人';
comment on column his_eng_order_operation.modify_time is '修改时间';
comment on column his_eng_order_operation.org_code is '*机构编码';
comment on column his_eng_order_operation.order_id is '住院ID';
comment on column his_eng_order_operation.code is '手术编码（ICD9-CM3）';
comment on column his_eng_order_operation.name is '手术名称';
comment on column his_eng_order_operation.start_time is '手术开始时间';
comment on column his_eng_order_operation.end_time is '手术结束时间';
comment on column his_eng_order_operation.incision_type is '切口类别';
comment on column his_eng_order_operation.incision_status is '愈合状态';
comment on column his_eng_order_operation.inplant is '是否有植入物';
alter table his_eng_order_operation
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOO_DATE_TIME on his_eng_order_operation (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOO_ORDER_ID on his_eng_order_operation (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOO_modify_time on his_eng_order_operation (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_order_exam
create table his_eng_order_exam
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(90),
  order_id          NVARCHAR2(90),
  lis_group_code    NVARCHAR2(90),
  lis_group_name    NVARCHAR2(90),
  exam_item_id      NVARCHAR2(90),
  exam_item_name    NVARCHAR2(90),
  reference_range   NVARCHAR2(90),
  result            NVARCHAR2(90),
  send_time         NVARCHAR2(90),
  abnormal_indicator NVARCHAR2(90),
  lis_time          NVARCHAR2(90),
  patient_no        NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_order_exam is '住院检验结果';
comment on column his_eng_order_exam.id is '主键';
comment on column his_eng_order_exam.creator is '创建人';
comment on column his_eng_order_exam.create_time is '创建时间';
comment on column his_eng_order_exam.modifier is '修改人';
comment on column his_eng_order_exam.modify_time is '修改时间';
comment on column his_eng_order_exam.org_code is '*机构编码';
comment on column his_eng_order_exam.order_id is '住院ID';
comment on column his_eng_order_exam.lis_group_code is '*检验组编码';
comment on column his_eng_order_exam.lis_group_name is '*检验组名称';
comment on column his_eng_order_exam.exam_item_id is '检验项目ID';
comment on column his_eng_order_exam.exam_item_name is '检验项目名称';
comment on column his_eng_order_exam.reference_range is '*参考值';
comment on column his_eng_order_exam.result is '*检验结果';
comment on column his_eng_order_exam.send_time is '开具时间';
comment on column his_eng_order_exam.abnormal_indicator is '*检验结果异常标志';
comment on column his_eng_order_exam.lis_time is '*检验时间';
comment on column his_eng_order_exam.patient_no is '*病人ID';
alter table his_eng_order_exam
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOE_DATE_TIME on his_eng_order_exam (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EOE_order_id on his_eng_order_exam (order_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;  
create index EOE_org_code on his_eng_order_exam (org_code)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;  
create index EOE_modify_time on his_eng_order_exam (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_register
create table his_register
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  visit_no          NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  name              NVARCHAR2(100),
  id_card           NVARCHAR2(80),
  depart_id         NVARCHAR2(90),
  department        NVARCHAR2(90),
  doc_id            NVARCHAR2(40),
  doc_name          NVARCHAR2(40),
  reg_date          NVARCHAR2(40)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_register is '挂号信息';
comment on column his_register.id is '主键';
comment on column his_register.creator is '创建人';
comment on column his_register.create_time is '创建时间';
comment on column his_register.modifier is '修改人';
comment on column his_register.modify_time is '修改时间';
comment on column his_register.org_code is '*机构编码';
comment on column his_register.visit_no is '*挂号流水号';
comment on column his_register.patient_no is '病人ID';
comment on column his_register.name is '病人姓名';
comment on column his_register.id_card is '病人身份证号';
comment on column his_register.depart_id is '科室ID';
comment on column his_register.department is '科室名称';
comment on column his_register.doc_id is '医生ID';
comment on column his_register.doc_name is '医生名称';
comment on column his_register.reg_date is '*挂号记录时间';
alter table his_register
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index REG_DATE_TIME on his_register (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index REG_PRES_VIIT_NO on his_register (visit_no)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index REG_modify_time on his_register (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_cf
create table his_eng_cf
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  cfid              NVARCHAR2(60),
  visit_no          NVARCHAR2(60),
  depart_id         NVARCHAR2(90),
  department        NVARCHAR2(200),
  age               NVARCHAR2(20),
  pres_type         NVARCHAR2(90),
  pres_date_time    NVARCHAR2(90),
  sex               NVARCHAR2(20),
  pay_type          NVARCHAR2(290),
  patient_no        NVARCHAR2(90),
  pres_no           NVARCHAR2(90),
  name              NVARCHAR2(100),
  address           NVARCHAR2(400),
  phone_no          NVARCHAR2(120),  
  id_card           NVARCHAR2(80),
  height            NVARCHAR2(40),
  weight            NVARCHAR2(40),
  birth_weight      NVARCHAR2(40),
  ccr               NVARCHAR2(20),
  allergy_list      NVARCHAR2(600),
  diagnose          NVARCHAR2(2000),
  pregnancy         NVARCHAR2(20),
  time_of_preg      NVARCHAR2(20),
  breast_feeding    NVARCHAR2(20),
  dialysis          NVARCHAR2(20),
  prox_name         NVARCHAR2(40),
  prox_id_card      NVARCHAR2(80),
  doc_id            NVARCHAR2(40),
  doc_name          NVARCHAR2(40),
  doc_title         NVARCHAR2(200),
  dept_group        NVARCHAR2(400),  
  total_amount      NVARCHAR2(40),
  pres_source       NVARCHAR2(200),
  corres_cf_presno  NVARCHAR2(90),
  recipe_type       NVARCHAR2(90),
  pharm_chk_id      NVARCHAR2(200),
  pharm_chk_name    NVARCHAR2(200)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the columns 
comment on table his_eng_cf is '门诊处方视图 ';
comment on column his_eng_cf.id is '主键';
comment on column his_eng_cf.creator is '创建人';
comment on column his_eng_cf.create_time is '创建时间';
comment on column his_eng_cf.modifier is '修改人';
comment on column his_eng_cf.modify_time is '修改时间';
comment on column his_eng_cf.org_code is '*机构编码';
comment on column his_eng_cf.cfid is '*处方ID号';
comment on column his_eng_cf.visit_no is '门诊号';
comment on column his_eng_cf.depart_id is '科室编号';
comment on column his_eng_cf.department is '科室名称';
comment on column his_eng_cf.age is '年龄';
comment on column his_eng_cf.pres_type is '处方类型';
comment on column his_eng_cf.pres_date_time is '处方医生开具时间';
comment on column his_eng_cf.sex is '性别';
comment on column his_eng_cf.pay_type is '费用类型';
comment on column his_eng_cf.patient_no is '患者号';
comment on column his_eng_cf.pres_no is '处方号';
comment on column his_eng_cf.name is '病人姓名';
comment on column his_eng_cf.address is '地址';
comment on column his_eng_cf.phone_no is '联系电话';
comment on column his_eng_cf.id_card is '身份证号';
comment on column his_eng_cf.height is '身高';
comment on column his_eng_cf.weight is '体重';
comment on column his_eng_cf.birth_weight is '出生时体重';
comment on column his_eng_cf.ccr is '内生肌酐清除率';
comment on column his_eng_cf.allergy_list is '过敏药品列表';
comment on column his_eng_cf.diagnose is '*诊断';
comment on column his_eng_cf.pregnancy is '是否怀孕';
comment on column his_eng_cf.time_of_preg is '孕期（周）';
comment on column his_eng_cf.breast_feeding is '是否哺乳';
comment on column his_eng_cf.dialysis is '是否透析';
comment on column his_eng_cf.prox_name is '代办人姓名';
comment on column his_eng_cf.prox_id_card is '代办人身份证号';
comment on column his_eng_cf.doc_id is '医生工号';
comment on column his_eng_cf.doc_name is '医生姓名';
comment on column his_eng_cf.doc_title is '医生职称';
comment on column his_eng_cf.dept_group is '科室组名称';
comment on column his_eng_cf.total_amount is '处方金额';
comment on column his_eng_cf.pres_source is '处方来源';
comment on column his_eng_cf.corres_cf_presno is '退药标记';
comment on column his_eng_cf.recipe_type is '处方类别';
comment on column his_eng_cf.pharm_chk_id is '*审核药师工号';
comment on column his_eng_cf.pharm_chk_name is '*审核药师姓名';
alter table his_eng_cf
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_DATE_TIME on his_eng_cf (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_CF_ID on his_eng_cf (cfId)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_PRES_NO on his_eng_cf (PRES_NO)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_DEPARTMENT on his_eng_cf (PRES_DATE_TIME, DEPARTMENT, DOC_NAME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_ORG_CODE on his_eng_cf (ORG_CODE)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_PRES_DATE_TIME on his_eng_cf (PRES_DATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index EC_modify_time on his_eng_cf (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;



-- his_eng_cf_item
create table his_eng_cf_item
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  item_id           NVARCHAR2(60),
  cfid              NVARCHAR2(60),
  drug_id           NVARCHAR2(80),
  drug_name         NVARCHAR2(200),
  reg_name          NVARCHAR2(200),
  manufacturer_name NVARCHAR2(200),
  continue_day      NVARCHAR2(90),  
  spec              NVARCHAR2(60),
  quantity          NVARCHAR2(40),
  dispense_unit     NVARCHAR2(90),
  unit_price        NVARCHAR2(40),
  amount            NVARCHAR2(40),
  group_no          NVARCHAR2(30),
  first_use         NVARCHAR2(20),
  prep_form         NVARCHAR2(80),
  admin_route       NVARCHAR2(100),
  admin_area        NVARCHAR2(100),
  admin_frequency   NVARCHAR2(100),
  admin_dose        NVARCHAR2(100),
  admin_dose_unit   NVARCHAR2(100),
  total_admin_dose  NVARCHAR2(90),
  total_admin_dose_unit NVARCHAR2(90),
  admin_method      NVARCHAR2(90),
  special_promote   NVARCHAR2(90),
  skin_test         NVARCHAR2(90),
  comments          NVARCHAR2(500)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_cf_item is '门诊处方明细视图';
comment on column his_eng_cf_item.id is '主键';
comment on column his_eng_cf_item.creator is '创建人';
comment on column his_eng_cf_item.create_time is '创建时间';
comment on column his_eng_cf_item.modifier is '修改人';
comment on column his_eng_cf_item.modify_time is '修改时间';
comment on column his_eng_cf_item.org_code is '*机构编码';
comment on column his_eng_cf_item.item_id is '*处方明细ID';
comment on column his_eng_cf_item.cfid is '处方ID，和主表关联';
comment on column his_eng_cf_item.drug_id is '*药品ID';
comment on column his_eng_cf_item.drug_name is '医院药品名称';
comment on column his_eng_cf_item.reg_name is '商品名称';
comment on column his_eng_cf_item.manufacturer_name is '厂家';
comment on column his_eng_cf_item.continue_day is '用药持续时间（天）';
comment on column his_eng_cf_item.spec is '规格';
comment on column his_eng_cf_item.quantity is '销售数量';
comment on column his_eng_cf_item.dispense_unit is '销售单位(最小销售单位)';
comment on column his_eng_cf_item.unit_price is '销售单位单价(元)';
comment on column his_eng_cf_item.amount is '销售金额(元)';
comment on column his_eng_cf_item.group_no is '组号';
comment on column his_eng_cf_item.first_use is '首剂使用';
comment on column his_eng_cf_item.prep_form is '剂型';
comment on column his_eng_cf_item.admin_route is '给药途径';
comment on column his_eng_cf_item.admin_area is '给药部位';
comment on column his_eng_cf_item.admin_frequency is '给药频率';
comment on column his_eng_cf_item.admin_dose is '单次给药剂量';
comment on column his_eng_cf_item.admin_dose_unit is '*单次给药剂量单位';
comment on column his_eng_cf_item.total_admin_dose is '总剂量';
comment on column his_eng_cf_item.total_admin_dose_unit is '*总剂量单位';
comment on column his_eng_cf_item.admin_method is '给药时机';
comment on column his_eng_cf_item.special_promote is '备注信息';
comment on column his_eng_cf_item.skin_test is '皮试结果';
comment on column his_eng_cf_item.comments is '*药品备注';
alter table his_eng_cf_item
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_DATE_TIME on his_eng_cf_item (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_CF_ID on his_eng_cf_item (cfId)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_ITEM_ID on his_eng_cf_item (item_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_DRUG_id on his_eng_cf_item (drug_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_DRUG_NAME on his_eng_cf_item (DRUG_NAME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_ORG_CODE on his_eng_cf_item (ORG_CODE)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECT_modify_time on his_eng_cf_item (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_cf_item_fee
create table his_eng_cf_item_fee
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(90),
  cost_id           NVARCHAR2(90),
  refund_flag       NVARCHAR2(90),
  visit_no          NVARCHAR2(90),
  cfid              NVARCHAR2(90),
  cf_item_id        NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  patient_name      NVARCHAR2(90),
  item_type         NVARCHAR2(90),
  fee_date          NVARCHAR2(90),
  item_id           NVARCHAR2(90),
  item_name         NVARCHAR2(90),
  item_unit         NVARCHAR2(90),
  item_unitprice    NVARCHAR2(90),
  item_quantity     NVARCHAR2(90),
  item_amount       NVARCHAR2(90),
  doc_id            NVARCHAR2(90),
  doc_name          NVARCHAR2(90),
  depart_id         NVARCHAR2(90),
  department        NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_cf_item_fee is '门诊收费明细表(门诊费用清单)';
comment on column his_eng_cf_item_fee.id is '主键';
comment on column his_eng_cf_item_fee.creator is '创建人';
comment on column his_eng_cf_item_fee.create_time is '创建时间';
comment on column his_eng_cf_item_fee.modifier is '修改人';
comment on column his_eng_cf_item_fee.modify_time is '修改时间';
comment on column his_eng_cf_item_fee.org_code is '*机构编码';
comment on column his_eng_cf_item_fee.cost_id is '业务编号';
comment on column his_eng_cf_item_fee.refund_flag is '退费标志';
comment on column his_eng_cf_item_fee.visit_no is '门诊挂号流水号';
comment on column his_eng_cf_item_fee.cfid is '*处方ID';
comment on column his_eng_cf_item_fee.cf_item_id is '处方明细ID';
comment on column his_eng_cf_item_fee.patient_no is '病人ID';
comment on column his_eng_cf_item_fee.patient_name is '病人姓名';
comment on column his_eng_cf_item_fee.item_type is '明细费用类别';
comment on column his_eng_cf_item_fee.fee_date is '收费/退费时间';
comment on column his_eng_cf_item_fee.item_id is '项目编码';
comment on column his_eng_cf_item_fee.item_name is '项目名称';
comment on column his_eng_cf_item_fee.item_unit is '项目单位';
comment on column his_eng_cf_item_fee.item_unitprice is '项目单价';
comment on column his_eng_cf_item_fee.item_quantity is '项目数量';
comment on column his_eng_cf_item_fee.item_amount is '项目金额';
comment on column his_eng_cf_item_fee.doc_id is '医生id';
comment on column his_eng_cf_item_fee.doc_name is '医生姓名';
comment on column his_eng_cf_item_fee.depart_id is '科室ID';
comment on column his_eng_cf_item_fee.department is '科室名称';
alter table his_eng_cf_item_fee
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECI_DATE_TIME on his_eng_cf_item_fee (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECI_COST_ID on his_eng_cf_item_fee (cost_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECI_cfid on his_eng_cf_item_fee (cfid)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECI_item_id on his_eng_cf_item_fee (item_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECI_modify_time on his_eng_cf_item_fee (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_eng_cf_drug_send
create table his_eng_cf_drug_send
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  send_id           NVARCHAR2(90),
  cfid              NVARCHAR2(90),
  cf_item_id        NVARCHAR2(90),
  dispense_store    NVARCHAR2(90),
  patient_no        NVARCHAR2(90),
  patient_name      NVARCHAR2(90),
  drug_id           NVARCHAR2(90),
  drug_name         NVARCHAR2(90),
  reg_name          NVARCHAR2(90),
  manufacturer_name NVARCHAR2(200),
  prep_form         NVARCHAR2(90),
  spec              NVARCHAR2(90),
  qty               NUMBER(20,4),
  qty_unit          NVARCHAR2(90),
  send_dose         NVARCHAR2(90),
  send_unit         NVARCHAR2(90),
  send_date_time    NVARCHAR2(90),
  pharm_audt_id     NVARCHAR2(90),
  pharm_audt_name   NVARCHAR2(90),
  pharm_pre_id      NVARCHAR2(90),
  pharm_pre_name    NVARCHAR2(90),
  pharm_chk_id      NVARCHAR2(90),
  pharm_chk_name    NVARCHAR2(90),
  pharm_delv_id     NVARCHAR2(90),
  pharm_delv_name   NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table his_eng_cf_drug_send is '门诊发药明细表(门诊各药房发药清单)';
comment on column his_eng_cf_drug_send.id is '主键';
comment on column his_eng_cf_drug_send.creator is '创建人';
comment on column his_eng_cf_drug_send.create_time is '创建时间';
comment on column his_eng_cf_drug_send.modifier is '修改人';
comment on column his_eng_cf_drug_send.modify_time is '修改时间';
comment on column his_eng_cf_drug_send.org_code is '*机构编码';
comment on column his_eng_cf_drug_send.send_id is '行唯一标识';
comment on column his_eng_cf_drug_send.cfid is '处方ID';
comment on column his_eng_cf_drug_send.cf_item_id is '处方明细ID';
comment on column his_eng_cf_drug_send.dispense_store is '发药药房名称';
comment on column his_eng_cf_drug_send.patient_no is '病人ID';
comment on column his_eng_cf_drug_send.patient_name is '病人姓名';
comment on column his_eng_cf_drug_send.drug_id is '药品ID';
comment on column his_eng_cf_drug_send.drug_name is '医院药品名称';
comment on column his_eng_cf_drug_send.reg_name is '商品名称';
comment on column his_eng_cf_drug_send.manufacturer_name is '厂家';
comment on column his_eng_cf_drug_send.prep_form is '剂型';
comment on column his_eng_cf_drug_send.spec is '规格';
comment on column his_eng_cf_drug_send.qty is '发药数量';
comment on column his_eng_cf_drug_send.qty_unit is '发药单位';
comment on column his_eng_cf_drug_send.send_dose is '发药剂量';
comment on column his_eng_cf_drug_send.send_unit is '发药剂量单位';
comment on column his_eng_cf_drug_send.send_date_time is '发药时间';
comment on column his_eng_cf_drug_send.pharm_audt_id is '*审核药师工号';
comment on column his_eng_cf_drug_send.pharm_audt_name is '*审核药师姓名';
comment on column his_eng_cf_drug_send.pharm_pre_id is '*备药药师工号';
comment on column his_eng_cf_drug_send.pharm_pre_name is '*备药药师姓名';
comment on column his_eng_cf_drug_send.pharm_chk_id is '*核对药师工号';
comment on column his_eng_cf_drug_send.pharm_chk_name is '*核对药师姓名';
comment on column his_eng_cf_drug_send.pharm_delv_id is '*发药药师工号';
comment on column his_eng_cf_drug_send.pharm_delv_name is '*发药药师姓名';
alter table his_eng_cf_drug_send
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECDS_DATE_TIME on his_eng_cf_drug_send (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECDS_CFID on his_eng_cf_drug_send (cfId)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECDS_SEND_ID on his_eng_cf_drug_send (send_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;  
create index ECDS_DRUG_ID on his_eng_cf_drug_send (DRUG_ID)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECDS_org_code on his_eng_cf_drug_send (org_code)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ECDS_modify_time on his_eng_cf_drug_send (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_drug_catalog
create table his_drug_catalog
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  drug_id           NVARCHAR2(90),
  drug_name         NVARCHAR2(160),
  trade_name        NVARCHAR2(60),
  spec_name         NVARCHAR2(400),
  prep_name         NVARCHAR2(90),
  manufacturer_name NVARCHAR2(200),
  pzwh              NVARCHAR2(100),
  mz_unit           NVARCHAR2(40),
  zy_unit           NVARCHAR2(40),
  bwm               NVARCHAR2(60),
  yp_id             NVARCHAR2(40),
  pharma_type       NVARCHAR2(90),
  drug_type         NVARCHAR2(40),
  use_flag          NVARCHAR2(10)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
comment on table his_drug_catalog is '医院药品目录数据';
comment on column his_drug_catalog.id is '主键';
comment on column his_drug_catalog.creator is '创建人';
comment on column his_drug_catalog.create_time is '创建时间';
comment on column his_drug_catalog.modifier is '修改人';
comment on column his_drug_catalog.modify_time is '修改时间';
comment on column his_drug_catalog.org_code is '*机构编码';
comment on column his_drug_catalog.drug_id is '医院药品编码';
comment on column his_drug_catalog.drug_name is '药品名称';
comment on column his_drug_catalog.trade_name is '商品名';
comment on column his_drug_catalog.spec_name is '规格';
comment on column his_drug_catalog.prep_name is '剂型';
comment on column his_drug_catalog.manufacturer_name is '生产企业';
comment on column his_drug_catalog.pzwh is '批准文号';
comment on column his_drug_catalog.mz_unit is '门诊使用单位';
comment on column his_drug_catalog.zy_unit is '住院使用单位';
comment on column his_drug_catalog.bwm is '本位码';
comment on column his_drug_catalog.yp_id is '药交ID';
comment on column his_drug_catalog.Pharma_type is '医院药理分类';
comment on column his_drug_catalog.drug_type is '药品分类';
comment on column his_drug_catalog.use_flag is '是否使用';
alter table his_drug_catalog
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DC_DATE_TIME on his_drug_catalog (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DC_DRUG_ID on his_drug_catalog (DRUG_ID)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DC_modify_time on his_drug_catalog (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;


-- his_drug_convert
create table his_drug_convert
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  drug_id           NVARCHAR2(90),
  drug_name         NVARCHAR2(160),
  unit_num         NVARCHAR2(1000),
  unit              NVARCHAR2(90),  
  convert_num       NVARCHAR2(100),
  convert_unit      NVARCHAR2(100)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
comment on table his_drug_convert is '药品单位转换比信息';
-- Add comments to the columns 
comment on column his_drug_convert.id is '主键';
comment on column his_drug_convert.creator is '创建人';
comment on column his_drug_convert.create_time is '创建时间';
comment on column his_drug_convert.modifier is '修改人';
comment on column his_drug_convert.modify_time is '修改时间';
comment on column his_drug_convert.org_code is '*机构编码';
comment on column his_drug_convert.drug_id is '药品ID';
comment on column his_drug_convert.drug_name is '药品名称';
comment on column his_drug_convert.unit_num is '单位数值';
comment on column his_drug_convert.unit is '单位';
comment on column his_drug_convert.convert_num is '转换后数值';
comment on column his_drug_convert.convert_unit is '转换后单位';
alter table his_drug_convert
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DCO_DATE_TIME on his_drug_convert (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DCO_DRUG_ID on his_drug_convert (DRUG_ID)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DCO_modify_time on his_drug_convert (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_department
create table his_department
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  dept_id           NVARCHAR2(100),
  dept_name         NVARCHAR2(100),
  dept_abbr         NVARCHAR2(100),
  dept_type         NVARCHAR2(20),
  hosp_area         NVARCHAR2(100)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table his_department is '科室信息';
-- Add comments to the columns 
comment on column his_department.id is '主键';
comment on column his_department.creator is '创建人';
comment on column his_department.create_time is '创建时间';
comment on column his_department.modifier is '修改人';
comment on column his_department.modify_time is '修改时间';
comment on column his_department.org_code is '*机构编码';
comment on column his_department.dept_id is '科室ID';
comment on column his_department.dept_name is '科室名称';
comment on column his_department.dept_abbr is '科室简称';
comment on column his_department.dept_type is '科室类型';
comment on column his_department.hosp_area is '所属院区';
alter table his_department
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DEPT_DATE_TIME on his_department (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DEPT_ID on his_department (dept_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DEPT_modify_time on his_department (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_doctor
create table his_doctor
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  doc_id            NVARCHAR2(40),
  doc_name          NVARCHAR2(100),
  doc_title      NVARCHAR2(20),
  work_scope        NVARCHAR2(800),
  depart_id         NVARCHAR2(100),
  department        NVARCHAR2(100)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
comment on table his_doctor is '医生信息';
comment on column his_doctor.id is '主键';
comment on column his_doctor.creator is '创建人';
comment on column his_doctor.create_time is '创建时间';
comment on column his_doctor.modifier is '修改人';
comment on column his_doctor.modify_time is '修改时间';
comment on column his_doctor.org_code is '*机构编码';
comment on column his_doctor.doc_id is '医生ID';
comment on column his_doctor.doc_name is '医生名称';
comment on column his_doctor.doc_title is '医生职称';
comment on column his_doctor.work_scope is '工作范围';
comment on column his_doctor.depart_id is '医生所属科室ID';
comment on column his_doctor.department is '医生所属科室名称';
alter table his_doctor
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DOC_DATE_TIME on his_doctor (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DOC_ID on his_doctor (doc_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index DOC_modify_time on his_doctor (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_admin_route
create table his_admin_route
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  route_id          NVARCHAR2(90),
  route_code        NVARCHAR2(90),
  route_name        NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
comment on table his_admin_route is '给药途径';
-- Add comments to the columns 
comment on column his_admin_route.id is '主键';
comment on column his_admin_route.creator is '创建人';
comment on column his_admin_route.create_time is '创建时间';
comment on column his_admin_route.modifier is '修改人';
comment on column his_admin_route.modify_time is '修改时间';
comment on column his_admin_route.org_code is '*机构编码';
comment on column his_admin_route.route_code is '给药途径编码';
comment on column his_admin_route.route_name is '给药途径名称';
alter table his_admin_route
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ADR_DATE_TIME on his_admin_route (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ADR_ROUTE_ID on his_admin_route (route_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ADR_modify_time on his_admin_route (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

-- his_admin_frequency
create table his_admin_frequency
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  freq_id           NVARCHAR2(90),
  freq_code         NVARCHAR2(90),
  freq_name         NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
comment on table his_admin_frequency is '给药频率';
-- Add comments to the columns 
comment on column his_admin_frequency.id is '主键';
comment on column his_admin_frequency.creator is '创建人';
comment on column his_admin_frequency.create_time is '创建时间';
comment on column his_admin_frequency.modifier is '修改人';
comment on column his_admin_frequency.modify_time is '修改时间';
comment on column his_admin_frequency.org_code is '*机构编码';
comment on column his_admin_frequency.freq_code is '给药频率编码';
comment on column his_admin_frequency.freq_name is '给药频率名称';
alter table his_admin_frequency
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ADF_DATE_TIME on his_admin_frequency (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ADF_FREQ_ID on his_admin_frequency (freq_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ADF_modify_time on his_admin_frequency (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
  
-- his_allergy
create table his_allergy
(
  id                NUMBER(20) not null,
  creator          NVARCHAR2(40),
  create_time       DATE,
  modifier          NVARCHAR2(40),
  modify_time       DATE,
  org_code          NVARCHAR2(100),
  alle_id           NVARCHAR2(90),
  alle_name         NVARCHAR2(90),
  alle_type         NVARCHAR2(90)
)
tablespace BMP
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
comment on table his_allergy is '过敏药物';
-- Add comments to the columns 
comment on column his_allergy.id is '主键';
comment on column his_allergy.creator is '创建人';
comment on column his_allergy.create_time is '创建时间';
comment on column his_allergy.modifier is '修改人';
comment on column his_allergy.modify_time is '修改时间';
comment on column his_allergy.org_code is '*机构编码';
comment on column his_allergy.alle_name is '过敏药物名称';
comment on column his_allergy.alle_type is '过敏药物类型';
alter table his_allergy
  add primary key (id)
  using index 
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ALLE_DATE_TIME on his_allergy (CREATE_TIME)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ALLE_ID on his_allergy (alle_id)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;
create index ALLE_modify_time on his_allergy (modify_time)
  tablespace BMP
  pctfree 10
  initrans 2
  maxtrans 255;

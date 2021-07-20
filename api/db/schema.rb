# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_19_154227) do

  create_table "columns_priv", primary_key: ["Host", "Db", "User", "Table_name", "Column_name"], charset: "utf8", collation: "utf8_bin", comment: "Column privileges", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Column_name", limit: 64, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.column "Column_priv", "set('Select','Insert','Update','References')", default: "", null: false, collation: "utf8_general_ci"
  end

  create_table "db", primary_key: ["Host", "Db", "User"], charset: "utf8", collation: "utf8_bin", comment: "Database privileges", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.column "Select_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Insert_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Update_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Delete_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Drop_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Grant_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "References_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Index_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_tmp_table_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Lock_tables_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Show_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Execute_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Event_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Trigger_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.index ["User"], name: "User"
  end

  create_table "engine_cost", primary_key: ["cost_name", "engine_name", "device_type"], charset: "utf8", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "engine_name", limit: 64, null: false
    t.integer "device_type", null: false
    t.string "cost_name", limit: 64, null: false
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
  end

  create_table "event", primary_key: ["db", "name"], charset: "utf8", comment: "Events", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "db", limit: 64, default: "", null: false, collation: "utf8_bin"
    t.string "name", limit: 64, default: "", null: false
    t.binary "body", size: :long, null: false
    t.string "definer", limit: 93, default: "", null: false, collation: "utf8_bin"
    t.datetime "execute_at"
    t.integer "interval_value"
    t.column "interval_field", "enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND')"
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "modified", null: false
    t.datetime "last_executed"
    t.datetime "starts"
    t.datetime "ends"
    t.column "status", "enum('ENABLED','DISABLED','SLAVESIDE_DISABLED')", default: "ENABLED", null: false
    t.column "on_completion", "enum('DROP','PRESERVE')", default: "DROP", null: false
    t.column "sql_mode", "set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH')", default: "", null: false
    t.string "comment", limit: 64, default: "", null: false, collation: "utf8_bin"
    t.integer "originator", null: false, unsigned: true
    t.string "time_zone", limit: 64, default: "SYSTEM", null: false, collation: "latin1_swedish_ci"
    t.string "character_set_client", limit: 32, collation: "utf8_bin"
    t.string "collation_connection", limit: 32, collation: "utf8_bin"
    t.string "db_collation", limit: 32, collation: "utf8_bin"
    t.binary "body_utf8", size: :long
  end

  create_table "func", primary_key: "name", id: { type: :string, limit: 64, default: "" }, charset: "utf8", collation: "utf8_bin", comment: "User defined functions", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.boolean "ret", default: false, null: false
    t.string "dl", limit: 128, default: "", null: false
    t.column "type", "enum('function','aggregate')", null: false, collation: "utf8_general_ci"
  end

  create_table "general_log", id: false, charset: "utf8", comment: "General log", options: "ENGINE=CSV", force: :cascade do |t|
    t.timestamp "event_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", size: :medium, null: false
    t.bigint "thread_id", null: false, unsigned: true
    t.integer "server_id", null: false, unsigned: true
    t.string "command_type", limit: 64, null: false
    t.binary "argument", size: :medium, null: false
  end

  create_table "gtid_executed", primary_key: ["source_uuid", "interval_start"], charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "source_uuid", limit: 36, null: false, comment: "uuid of the source where the transaction was originally executed."
    t.bigint "interval_start", null: false, comment: "First number of interval."
    t.bigint "interval_end", null: false, comment: "Last number of interval."
  end

  create_table "help_category", primary_key: "help_category_id", id: { type: :integer, limit: 2, unsigned: true, default: nil }, charset: "utf8", comment: "help categories", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "parent_category_id", limit: 2, unsigned: true
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_keyword", primary_key: "help_keyword_id", id: { type: :integer, unsigned: true, default: nil }, charset: "utf8", comment: "help keywords", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_relation", primary_key: ["help_keyword_id", "help_topic_id"], charset: "utf8", comment: "keyword-topic relation", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "help_topic_id", null: false, unsigned: true
    t.integer "help_keyword_id", null: false, unsigned: true
  end

  create_table "help_topic", primary_key: "help_topic_id", id: { type: :integer, unsigned: true, default: nil }, charset: "utf8", comment: "help topics", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "help_category_id", limit: 2, null: false, unsigned: true
    t.text "description", null: false
    t.text "example", null: false
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "innodb_index_stats", primary_key: ["database_name", "table_name", "index_name", "stat_name"], charset: "utf8", collation: "utf8_bin", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.string "index_name", limit: 64, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "stat_name", limit: 64, null: false
    t.bigint "stat_value", null: false, unsigned: true
    t.bigint "sample_size", unsigned: true
    t.string "stat_description", limit: 1024, null: false
  end

  create_table "innodb_table_stats", primary_key: ["database_name", "table_name"], charset: "utf8", collation: "utf8_bin", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "n_rows", null: false, unsigned: true
    t.bigint "clustered_index_size", null: false, unsigned: true
    t.bigint "sum_of_other_index_sizes", null: false, unsigned: true
  end

  create_table "ndb_binlog_index", primary_key: ["epoch", "orig_server_id", "orig_epoch"], charset: "utf8mb4", collation: "utf8mb4_unicode_ci", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "Position", null: false, unsigned: true
    t.string "File", null: false
    t.bigint "epoch", null: false, unsigned: true
    t.integer "inserts", null: false, unsigned: true
    t.integer "updates", null: false, unsigned: true
    t.integer "deletes", null: false, unsigned: true
    t.integer "schemaops", null: false, unsigned: true
    t.integer "orig_server_id", null: false, unsigned: true
    t.bigint "orig_epoch", null: false, unsigned: true
    t.integer "gci", null: false, unsigned: true
    t.bigint "next_position", null: false, unsigned: true
    t.string "next_file", null: false
  end

  create_table "plugin", primary_key: "name", id: { type: :string, limit: 64, default: "" }, charset: "utf8", comment: "MySQL plugins", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "dl", limit: 128, default: "", null: false
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proc", primary_key: ["db", "name", "type"], charset: "utf8", comment: "Stored Procedures", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "db", limit: 64, default: "", null: false, collation: "utf8_bin"
    t.string "name", limit: 64, default: "", null: false
    t.column "type", "enum('FUNCTION','PROCEDURE')", null: false
    t.string "specific_name", limit: 64, default: "", null: false
    t.column "language", "enum('SQL')", default: "SQL", null: false
    t.column "sql_data_access", "enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA')", default: "CONTAINS_SQL", null: false
    t.column "is_deterministic", "enum('YES','NO')", default: "NO", null: false
    t.column "security_type", "enum('INVOKER','DEFINER')", default: "DEFINER", null: false
    t.binary "param_list", null: false
    t.binary "returns", size: :long, null: false
    t.binary "body", size: :long, null: false
    t.string "definer", limit: 93, default: "", null: false, collation: "utf8_bin"
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "modified", null: false
    t.column "sql_mode", "set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH')", default: "", null: false
    t.text "comment", null: false, collation: "utf8_bin"
    t.string "character_set_client", limit: 32, collation: "utf8_bin"
    t.string "collation_connection", limit: 32, collation: "utf8_bin"
    t.string "db_collation", limit: 32, collation: "utf8_bin"
    t.binary "body_utf8", size: :long
  end

  create_table "procs_priv", primary_key: ["Host", "Db", "User", "Routine_name", "Routine_type"], charset: "utf8", collation: "utf8_bin", comment: "Procedure privileges", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Routine_name", limit: 64, default: "", null: false, collation: "utf8_general_ci"
    t.column "Routine_type", "enum('FUNCTION','PROCEDURE')", null: false
    t.string "Grantor", limit: 93, default: "", null: false
    t.column "Proc_priv", "set('Execute','Alter Routine','Grant')", default: "", null: false, collation: "utf8_general_ci"
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "proxies_priv", primary_key: ["Host", "User", "Proxied_host", "Proxied_user"], charset: "utf8", collation: "utf8_bin", comment: "User proxy privileges", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Proxied_host", limit: 60, default: "", null: false
    t.string "Proxied_user", limit: 32, default: "", null: false
    t.boolean "With_grant", default: false, null: false
    t.string "Grantor", limit: 93, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "server_cost", primary_key: "cost_name", id: { type: :string, limit: 64 }, charset: "utf8", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
  end

  create_table "servers", primary_key: "Server_name", id: { type: :string, limit: 64, default: "" }, charset: "utf8", comment: "MySQL Foreign Servers table", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "Host", limit: 64, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "Username", limit: 64, default: "", null: false
    t.string "Password", limit: 64, default: "", null: false
    t.integer "Port", default: 0, null: false
    t.string "Socket", limit: 64, default: "", null: false
    t.string "Wrapper", limit: 64, default: "", null: false
    t.string "Owner", limit: 64, default: "", null: false
  end

  create_table "slave_master_info", primary_key: "Channel_name", id: { type: :string, limit: 64, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication" }, charset: "utf8", comment: "Master Information", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file.", unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin", comment: "The name of the master binary log currently being read from the master."
    t.bigint "Master_log_pos", null: false, comment: "The master log position of the last read event.", unsigned: true
    t.string "Host", limit: 64, collation: "utf8_bin", comment: "The host name of the master."
    t.text "User_name", collation: "utf8_bin", comment: "The user name used to connect to the master."
    t.text "User_password", collation: "utf8_bin", comment: "The password used to connect to the master."
    t.integer "Port", null: false, comment: "The network port used to connect to the master.", unsigned: true
    t.integer "Connect_retry", null: false, comment: "The period (in seconds) that the slave will wait before trying to reconnect to the master.", unsigned: true
    t.boolean "Enabled_ssl", null: false, comment: "Indicates whether the server supports SSL connections."
    t.text "Ssl_ca", collation: "utf8_bin", comment: "The file used for the Certificate Authority (CA) certificate."
    t.text "Ssl_capath", collation: "utf8_bin", comment: "The path to the Certificate Authority (CA) certificates."
    t.text "Ssl_cert", collation: "utf8_bin", comment: "The name of the SSL certificate file."
    t.text "Ssl_cipher", collation: "utf8_bin", comment: "The name of the cipher in use for the SSL connection."
    t.text "Ssl_key", collation: "utf8_bin", comment: "The name of the SSL key file."
    t.boolean "Ssl_verify_server_cert", null: false, comment: "Whether to verify the server certificate."
    t.float "Heartbeat", null: false
    t.text "Bind", collation: "utf8_bin", comment: "Displays which interface is employed when connecting to the MySQL server"
    t.text "Ignored_server_ids", collation: "utf8_bin", comment: "The number of server IDs to be ignored, followed by the actual server IDs"
    t.text "Uuid", collation: "utf8_bin", comment: "The master server uuid."
    t.bigint "Retry_count", null: false, comment: "Number of reconnect attempts, to the master, before giving up.", unsigned: true
    t.text "Ssl_crl", collation: "utf8_bin", comment: "The file used for the Certificate Revocation List (CRL)"
    t.text "Ssl_crlpath", collation: "utf8_bin", comment: "The path used for Certificate Revocation List (CRL) files"
    t.boolean "Enabled_auto_position", null: false, comment: "Indicates whether GTIDs will be used to retrieve events from the master."
    t.text "Tls_version", collation: "utf8_bin", comment: "Tls version"
  end

  create_table "slave_relay_log_info", primary_key: "Channel_name", id: { type: :string, limit: 64, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication" }, charset: "utf8", comment: "Relay Log Information", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file or rows in the table. Used to version table definitions.", unsigned: true
    t.text "Relay_log_name", null: false, collation: "utf8_bin", comment: "The name of the current relay log file."
    t.bigint "Relay_log_pos", null: false, comment: "The relay log position of the last executed event.", unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin", comment: "The name of the master binary log file from which the events in the relay log file were read."
    t.bigint "Master_log_pos", null: false, comment: "The master log position of the last executed event.", unsigned: true
    t.integer "Sql_delay", null: false, comment: "The number of seconds that the slave must lag behind the master."
    t.integer "Number_of_workers", null: false, unsigned: true
    t.integer "Id", null: false, comment: "Internal Id that uniquely identifies this record.", unsigned: true
  end

  create_table "slave_worker_info", primary_key: ["Channel_name", "Id"], charset: "utf8", comment: "Worker Information", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Id", null: false, unsigned: true
    t.text "Relay_log_name", null: false, collation: "utf8_bin"
    t.bigint "Relay_log_pos", null: false, unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin"
    t.bigint "Master_log_pos", null: false, unsigned: true
    t.text "Checkpoint_relay_log_name", null: false, collation: "utf8_bin"
    t.bigint "Checkpoint_relay_log_pos", null: false, unsigned: true
    t.text "Checkpoint_master_log_name", null: false, collation: "utf8_bin"
    t.bigint "Checkpoint_master_log_pos", null: false, unsigned: true
    t.integer "Checkpoint_seqno", null: false, unsigned: true
    t.integer "Checkpoint_group_size", null: false, unsigned: true
    t.binary "Checkpoint_group_bitmap", null: false
    t.string "Channel_name", limit: 64, null: false, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication"
  end

  create_table "slow_log", id: false, charset: "utf8", comment: "Slow log", options: "ENGINE=CSV", force: :cascade do |t|
    t.timestamp "start_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", size: :medium, null: false
    t.time "query_time", precision: 6, null: false
    t.time "lock_time", precision: 6, null: false
    t.integer "rows_sent", null: false
    t.integer "rows_examined", null: false
    t.string "db", limit: 512, null: false
    t.integer "last_insert_id", null: false
    t.integer "insert_id", null: false
    t.integer "server_id", null: false, unsigned: true
    t.binary "sql_text", size: :medium, null: false
    t.bigint "thread_id", null: false, unsigned: true
  end

  create_table "tables_priv", primary_key: ["Host", "Db", "User", "Table_name"], charset: "utf8", collation: "utf8_bin", comment: "Table privileges", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Grantor", limit: 93, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.column "Table_priv", "set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger')", default: "", null: false, collation: "utf8_general_ci"
    t.column "Column_priv", "set('Select','Insert','Update','References')", default: "", null: false, collation: "utf8_general_ci"
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "time_zone", primary_key: "Time_zone_id", id: { type: :integer, unsigned: true }, charset: "utf8", comment: "Time zones", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.column "Use_leap_seconds", "enum('Y','N')", default: "N", null: false
  end

  create_table "time_zone_leap_second", primary_key: "Transition_time", id: :bigint, default: nil, charset: "utf8", comment: "Leap seconds information for time zones", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Correction", null: false
  end

  create_table "time_zone_name", primary_key: "Name", id: { type: :string, limit: 64 }, charset: "utf8", comment: "Time zone names", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
  end

  create_table "time_zone_transition", primary_key: ["Time_zone_id", "Transition_time"], charset: "utf8", comment: "Time zone transitions", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.bigint "Transition_time", null: false
    t.integer "Transition_type_id", null: false, unsigned: true
  end

  create_table "time_zone_transition_type", primary_key: ["Time_zone_id", "Transition_type_id"], charset: "utf8", comment: "Time zone transition types", options: "ENGINE=InnoDB STATS_PERSISTENT=0", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.integer "Transition_type_id", null: false, unsigned: true
    t.integer "Offset", default: 0, null: false
    t.integer "Is_DST", limit: 1, default: 0, null: false, unsigned: true
    t.string "Abbreviation", limit: 8, default: "", null: false
  end

  create_table "user", primary_key: ["Host", "User"], charset: "utf8", collation: "utf8_bin", comment: "Users and global privileges", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.column "Select_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Insert_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Update_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Delete_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Drop_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Reload_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Shutdown_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Process_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "File_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Grant_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "References_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Index_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Show_db_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Super_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_tmp_table_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Lock_tables_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Execute_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Repl_slave_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Repl_client_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Show_view_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Alter_routine_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_user_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Event_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Trigger_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "Create_tablespace_priv", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.column "ssl_type", "enum('','ANY','X509','SPECIFIED')", default: "", null: false, collation: "utf8_general_ci"
    t.binary "ssl_cipher", null: false
    t.binary "x509_issuer", null: false
    t.binary "x509_subject", null: false
    t.integer "max_questions", default: 0, null: false, unsigned: true
    t.integer "max_updates", default: 0, null: false, unsigned: true
    t.integer "max_connections", default: 0, null: false, unsigned: true
    t.integer "max_user_connections", default: 0, null: false, unsigned: true
    t.string "plugin", limit: 64, default: "mysql_native_password", null: false
    t.text "authentication_string"
    t.column "password_expired", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
    t.timestamp "password_last_changed"
    t.integer "password_lifetime", limit: 2, unsigned: true
    t.column "account_locked", "enum('N','Y')", default: "N", null: false, collation: "utf8_general_ci"
  end

end

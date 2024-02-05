# The name of this view in Looker is "Vw Dim Squad"
view: vw_dim_squad {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `santo-data-warehouse-prod.PORTFOLIO_PROJETOS_TRUSTED.VW_DIM_SQUAD` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Atualizado Por" in Explore.

  dimension: atualizado_por {
    type: string
    sql: ${TABLE}.atualizado_por ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension: minha_data {
    type: date
    sql: ${data_atualizacao_date};;
  }

  dimension_group: data_atualizacao {
    type: time
    timeframes: [raw, time_of_day, quarter_of_year, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_atualizacao ;;
  }

  dimension_group: data_criacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_criacao ;;
  }

  dimension: squad {
    type: string
    sql: ${TABLE}.squad ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: nova_medida {
    type: count_distinct
    sql: ${squad} ;;
  }
}

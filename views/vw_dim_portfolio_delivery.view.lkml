# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_dim_portfolio_delivery {
  hidden: yes
    join: vw_dim_portfolio_delivery__squad {
      view_label: "Vw Dim Portfolio Delivery: Squad"
      sql: LEFT JOIN UNNEST(${vw_dim_portfolio_delivery.squad}) as vw_dim_portfolio_delivery__squad ;;
      relationship: one_to_many
    }
}
# The name of this view in Looker is "Vw Dim Portfolio Delivery"
view: vw_dim_portfolio_delivery {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `santo-data-warehouse-prod.PORTFOLIO_PROJETOS_TRUSTED.VW_DIM_PORTFOLIO_DELIVERY` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account Manager" in Explore.

  dimension: account_manager {
    type: string
    sql: ${TABLE}.account_manager ;;
  }

  dimension: consome_billing_google {
    type: string
    sql: ${TABLE}.consome_billing_google ;;
  }

  dimension: consome_billing_santo {
    type: string
    sql: ${TABLE}.consome_billing_santo ;;
  }

  dimension: custo_previsto {
    type: string
    sql: ${TABLE}.custo_previsto ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_assinatura_proposta {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_assinatura_proposta ;;
  }

  dimension_group: data_de_atualizao {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_de_atualizao ;;
  }

  dimension_group: data_encerramento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_encerramento ;;
  }

  dimension_group: data_inclusao_no_portifolio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_inclusao_no_portifolio ;;
  }

  dimension_group: data_inicio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_inicio ;;
  }

  dimension_group: data_previso_conclusao {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_previso_conclusao ;;
  }

  dimension: farol {
    type: string
    sql: ${TABLE}.farol ;;
  }

  dimension: id_oportunidade {
    type: string
    sql: ${TABLE}.id_oportunidade ;;
  }

  dimension: informacao_do_projeto {
    type: string
    sql: ${TABLE}.informacao_do_projeto ;;
  }

  dimension: lider_tecnico {
    type: string
    sql: ${TABLE}.lider_tecnico ;;
  }

  dimension: link_da_proposta {
    type: string
    sql: ${TABLE}.Link_da_Proposta ;;
  }

  dimension: migrado_spam {
    type: string
    sql: ${TABLE}.migrado_spam ;;
  }

  dimension: pre_vendas {
    type: string
    sql: ${TABLE}.pre_vendas ;;
  }

  dimension: prioridade {
    type: number
    sql: ${TABLE}.prioridade ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_prioridade {
    type: sum
    sql: ${prioridade} ;;  }
  measure: average_prioridade {
    type: average
    sql: ${prioridade} ;;  }

  dimension: projeto {
    type: string
    sql: ${TABLE}.projeto ;;
  }

  dimension_group: recordstamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.recordstamp ;;
  }

  dimension: responsavel_gestor {
    type: string
    sql: ${TABLE}.responsavel_gestor ;;
  }

  dimension: satisfacao_do_cliente {
    type: string
    sql: ${TABLE}.satisfacao_do_cliente ;;
  }

  dimension: segmento_google {
    type: string
    sql: ${TABLE}.segmento_google ;;
  }

  dimension: setor {
    type: string
    sql: ${TABLE}.setor ;;
  }

  dimension: situacao {
    type: string
    sql: ${TABLE}.situacao ;;
  }

  dimension: situacao_projeto {
    type: string
    sql: ${TABLE}.situacao_projeto ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: squad {
    hidden: yes
    sql: ${TABLE}.squad ;;
  }

  dimension: status_execucao {
    type: string
    sql: ${TABLE}.status_execucao ;;
  }

  dimension: tamanho_projeto {
    type: string
    sql: ${TABLE}.tamanho_projeto ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.Time ;;
  }

  dimension: tipo_execucao {
    type: string
    sql: ${TABLE}.tipo_execucao ;;
  }

  dimension: tipo_faturamento {
    type: string
    sql: ${TABLE}.tipo_faturamento ;;
  }

  dimension: tipo_projeto {
    type: string
    sql: ${TABLE}.tipo_projeto ;;
  }

  dimension: total_horas_previstas {
    type: number
    sql: ${TABLE}.`total horas previstas` ;;
  }

  dimension: transferencia_billing_realizada {
    type: string
    sql: ${TABLE}.transferencia_billing_realizada ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

# The name of this view in Looker is "Vw Dim Portfolio Delivery Squad"
view: vw_dim_portfolio_delivery__squad {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: email ;;
  }

  dimension: role {
    type: string
    sql: role ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: vw_dim_portfolio_delivery__squad {
    type: string
    hidden: yes
    sql: vw_dim_portfolio_delivery__squad ;;
  }
}

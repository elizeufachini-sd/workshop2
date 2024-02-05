# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_dim_projeto {
  hidden: yes
    join: vw_dim_projeto__planejamento__versoes {
      view_label: "Vw Dim Projeto: Planejamento Versoes"
      sql: LEFT JOIN UNNEST(${vw_dim_projeto.planejamento__versoes}) as vw_dim_projeto__planejamento__versoes ;;
      relationship: one_to_many
    }
}
# The name of this view in Looker is "Vw Dim Projeto"
view: vw_dim_projeto {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `santo-data-warehouse-prod.PORTFOLIO_PROJETOS_TRUSTED.VW_DIM_PROJETO` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "ID Oportunidade" in Explore.

  dimension: id_oportunidade {
    type: string
    sql: ${TABLE}.id_oportunidade ;;
  }

  dimension: id_squad {
    type: string
    sql: ${TABLE}.id_squad ;;
  }

  dimension: planejamento__atualizado_por {
    type: string
    sql: ${TABLE}.planejamento.atualizado_por ;;
    group_label: "Planejamento"
    group_item_label: "Atualizado Por"
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: planejamento__data_atualizacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.planejamento.data_atualizacao ;;
  }

  dimension_group: planejamento__data_criacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.planejamento.data_criacao ;;
  }

  dimension_group: planejamento__data_fim {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.planejamento.data_fim ;;
  }

  dimension_group: planejamento__data_inicio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.planejamento.data_inicio ;;
  }

  dimension: planejamento__id {
    type: string
    sql: ${TABLE}.planejamento.id ;;
    group_label: "Planejamento"
    group_item_label: "ID"
  }

  dimension: planejamento__id_projeto {
    type: string
    sql: ${TABLE}.planejamento.id_projeto ;;
    group_label: "Planejamento"
    group_item_label: "ID Projeto"
  }

  dimension: planejamento__motivo {
    type: string
    sql: ${TABLE}.planejamento.motivo ;;
    group_label: "Planejamento"
    group_item_label: "Motivo"
  }

  dimension: planejamento__versao {
    type: number
    sql: ${TABLE}.planejamento.versao ;;
    group_label: "Planejamento"
    group_item_label: "Versao"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_planejamento__versao {
    type: sum
    sql: ${planejamento__versao} ;;  }
  measure: average_planejamento__versao {
    type: average
    sql: ${planejamento__versao} ;;  }

  dimension: planejamento__versao_atual {
    type: yesno
    sql: ${TABLE}.planejamento.versao_atual ;;
    group_label: "Planejamento"
    group_item_label: "Versao Atual"
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: planejamento__versoes {
    hidden: yes
    sql: ${TABLE}.planejamento.versoes ;;
    group_label: "Planejamento"
    group_item_label: "Versoes"
  }

  dimension: programa__atualizado_por {
    type: string
    sql: ${TABLE}.programa.atualizado_por ;;
    group_label: "Programa"
    group_item_label: "Atualizado Por"
  }

  dimension_group: programa__data_atualizacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.programa.data_atualizacao ;;
  }

  dimension_group: programa__data_criacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.programa.data_criacao ;;
  }

  dimension_group: programa__data_final {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.programa.data_final ;;
  }

  dimension_group: programa__data_inicial {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.programa.data_inicial ;;
  }

  dimension: programa__id {
    type: string
    sql: ${TABLE}.programa.id ;;
    group_label: "Programa"
    group_item_label: "ID"
  }

  dimension: programa__iniciativa {
    type: string
    sql: ${TABLE}.programa.iniciativa ;;
    group_label: "Programa"
    group_item_label: "Iniciativa"
  }

  dimension: programa__programa {
    type: string
    sql: ${TABLE}.programa.programa ;;
    group_label: "Programa"
    group_item_label: "Programa"
  }

  dimension: programa__status {
    type: string
    sql: ${TABLE}.programa.status ;;
    group_label: "Programa"
    group_item_label: "Status"
  }

  dimension: projeto__atualizado_por {
    type: string
    sql: ${TABLE}.projeto.atualizado_por ;;
    group_label: "Projeto"
    group_item_label: "Atualizado Por"
  }

  dimension_group: projeto__data_assinatura_proposta {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.projeto.data_assinatura_proposta ;;
  }

  dimension_group: projeto__data_atualizacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.projeto.data_atualizacao ;;
  }

  dimension_group: projeto__data_criacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.projeto.data_criacao ;;
  }

  dimension_group: projeto__data_encerramento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.projeto.data_encerramento ;;
  }

  dimension: projeto__descricao {
    type: string
    sql: ${TABLE}.projeto.descricao ;;
    group_label: "Projeto"
    group_item_label: "Descricao"
  }

  dimension: projeto__farol {
    type: string
    sql: ${TABLE}.projeto.farol ;;
    group_label: "Projeto"
    group_item_label: "Farol"
  }

  dimension: projeto__id {
    type: string
    sql: ${TABLE}.projeto.id ;;
    group_label: "Projeto"
    group_item_label: "ID"
  }

  dimension: projeto__link_documentacao {
    type: string
    sql: ${TABLE}.projeto.link_documentacao ;;
    group_label: "Projeto"
    group_item_label: "Link Documentacao"
  }

  dimension: projeto__link_proposta {
    type: string
    sql: ${TABLE}.projeto.link_proposta ;;
    group_label: "Projeto"
    group_item_label: "Link Proposta"
  }

  dimension: projeto__pacote {
    type: number
    sql: ${TABLE}.projeto.pacote ;;
    group_label: "Projeto"
    group_item_label: "Pacote"
  }

  dimension: projeto__projeto {
    type: string
    sql: ${TABLE}.projeto.projeto ;;
    group_label: "Projeto"
    group_item_label: "Projeto"
  }

  dimension: projeto__satisfacao_cliente {
    type: string
    sql: ${TABLE}.projeto.satisfacao_cliente ;;
    group_label: "Projeto"
    group_item_label: "Satisfacao Cliente"
  }

  dimension: projeto__situacao_projeto {
    type: string
    sql: ${TABLE}.projeto.situacao_projeto ;;
    group_label: "Projeto"
    group_item_label: "Situacao Projeto"
  }

  dimension: projeto__status {
    type: string
    sql: ${TABLE}.projeto.status ;;
    group_label: "Projeto"
    group_item_label: "Status"
  }

  dimension: projeto__tipo_execucao {
    type: string
    sql: ${TABLE}.projeto.tipo_execucao ;;
    group_label: "Projeto"
    group_item_label: "Tipo Execucao"
  }

  dimension: projeto__tribo {
    type: string
    sql: ${TABLE}.projeto.tribo ;;
    group_label: "Projeto"
    group_item_label: "Tribo"
  }

  dimension_group: recordstamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.recordstamp ;;
  }
  measure: count {
    type: count
  }
}

# The name of this view in Looker is "Vw Dim Projeto Planejamento Versoes"
view: vw_dim_projeto__planejamento__versoes {
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

  dimension_group: data_atualizacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_atualizacao ;;
  }

  dimension_group: data_criacao {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.data_criacao ;;
  }

  dimension_group: data_fim {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_fim ;;
  }

  dimension_group: data_inicio {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_inicio ;;
  }

  dimension: id_projeto {
    type: string
    sql: ${TABLE}.id_projeto ;;
  }

  dimension: motivo {
    type: string
    sql: ${TABLE}.motivo ;;
  }

  dimension: versao {
    type: number
    sql: ${TABLE}.versao ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_versao {
    type: sum
    sql: ${versao} ;;  }
  measure: average_versao {
    type: average
    sql: ${versao} ;;  }

  dimension: versao_atual {
    type: yesno
    sql: ${TABLE}.versao_atual ;;
  }
}

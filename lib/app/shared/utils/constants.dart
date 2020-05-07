import "package:flutter/material.dart";

/// Table label for solar radiation values for months
const textLabelMonths = "Irradiação solar diária média mensal [kWh/m2.dia]";

/// List of all Brazilian states
const statesBR = [
  "Acre",
  "Alagoas",
  "Amapá",
  "Amazonas",
  "Bahia",
  "Ceará",
  "Distrito Federal",
  "Espírito Santo",
  "Goiás",
  "Maranhão",
  "Mato Grosso",
  "Mato Grosso do Sul",
  "Minas Gerais",
  "Paraná",
  "Paraíba",
  "Pará",
  "Pernambuco",
  "Piauí",
  "Rio Grande do Norte",
  "Rio Grande do Sul",
  "Rio de Janeiro",
  "Rondônia",
  "Roraima",
  "Santa Catarina",
  "Sergipe",
  "São Paulo",
  "Tocantins"
];

/// List of Brazilian states and their respective ibge id
const statesBrasil = {
  "Acre": "12",
  "Alagoas": "27",
  "Amapá": "16",
  "Amazonas": "13",
  "Bahia": "29",
  "Ceará": "23",
  "Distrito Federal": "53",
  "Espírito Santo": "32",
  "Goiás": "52",
  "Maranhão": "21",
  "Mato Grosso": "51",
  "Mato Grosso do Sul": "50",
  "Minas Gerais": "31",
  "Paraná": "41",
  "Paraíba": "25",
  "Pará": "15",
  "Pernambuco": "26",
  "Piauí": "22",
  "Rio Grande do Norte": "24",
  "Rio Grande do Sul": "43",
  "Rio de Janeiro": "33",
  "Rondônia": "11",
  "Roraima": "14",
  "Santa Catarina": "42",
  "Sergipe": "28",
  "São Paulo": "35",
  "Tocantins": "17",
};

/// List of all months of the year
const months = [
  'JAN',
  'FEV',
  'MAR',
  'ABR',
  'MAI',
  'JUN',
  'JUL',
  'AGO',
  'SET',
  'OUT',
  'NOV',
  'DEZ'
];

/// List of station table titles
const columnTableStations = {
  "Estação": "Local da estação de medição da irradiação solar",
  "Município/UF": "Município/Estado do local da estação",
  "Latitude": "Coordenada Geografica em graus(decimal)",
  "Longitude": "Coordenada Geografica em graus(decimal)",
  "Distância": "Distância até o centro da cidade escolhida",
  "JAN": textLabelMonths,
  "FEV": textLabelMonths,
  "MAR": textLabelMonths,
  "ABR": textLabelMonths,
  "MAI": textLabelMonths,
  "JUN": textLabelMonths,
  "JUL": textLabelMonths,
  "AGO": textLabelMonths,
  "SET": textLabelMonths,
  "OUT": textLabelMonths,
  "NOV": textLabelMonths,
  "DEZ": textLabelMonths,
  "Média\nanual ": "Média anual na inclinação indicada",
  " Delta": "Diferença entre o maior e o menor valor de irradiação ",
};

/// List of inclined plane data table titles
const columnTableInformation = {
  "Posição": "Posição utilizada para obter os resultados",
  "Inclinação": "Inclinação utilizada para obter os resultados",
  "JAN": textLabelMonths,
  "FEV": textLabelMonths,
  "MAR": textLabelMonths,
  "ABR": textLabelMonths,
  "MAI": textLabelMonths,
  "JUN": textLabelMonths,
  "JUL": textLabelMonths,
  "AGO": textLabelMonths,
  "SET": textLabelMonths,
  "OUT": textLabelMonths,
  "NOV": textLabelMonths,
  "DEZ": textLabelMonths,
  "Média\nanual": "Média anual na inclinação indicada",
  "Delta": "Diferença entre o maior e o menor valor de irradiação",
};

/// List of colors of the graph lines
const linesGraph = [
  Colors.yellowAccent,
  Colors.orangeAccent,
  Colors.tealAccent,
  Colors.deepOrangeAccent,
];

/// List of subtitles of the inclined plane graph
const subtitlesGraphInclination = [
  'Plano Horizontal',
  'Ângulo igual a latitude',
  'Maior média anual',
  'Maior mínimo mensal'
];

/// Data box key for the localities near the selected point
const boxLocalesName = 'locales';

/// Data box key for the geographic coordinate of the selected point
const boxCurrentCoordinateName = 'current_coordinate';

/// Key of the selected point state data box
const boxCityStateName = 'city_state';

/// Key of the selected point city data box
const boxLoadedName = 'loaded_data';

/// Stylization of the input text border
const outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)));

//Daniel Alejandro Castillo Martín
//Guadalajara, México
//Experience: Data science, data engineering and ML algorithm-based models, project management. I have a degree in financial administration and systems, and I'm currently working as a Data Scientist in financial services company; previously worked in an electronic manufacturing company and collaborated in a crypto startup founding team.

//My First Actor
actor{

  var name = "";
//Update variable name
  public shared func inputName(newName: Text): () {
    name := newName
  } ;
//Query variable name
  public shared query func retrieveName (): async Text{
    return name;
  };
};
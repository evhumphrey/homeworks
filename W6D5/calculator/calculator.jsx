import React from 'react';

class Calculator extends React.Component {

  constructor(props) {
    super(props);

    // state below
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };

    //binds
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);
    this.operation = this.operation.bind(this);
    this._doMath = this._doMath.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    const inputNum1 = this._validateInput(e.target.value);

    if (inputNum1 !== undefined) {
      this.setState({ num1: inputNum1 });
    }
  }

  setNum2(e) {
    e.preventDefault();
    const inputNum2 = this._validateInput(e.target.value);

    if (inputNum2 !== undefined) {
      this.setState({ num2: inputNum2 });
    }
  }

  _validateInput(num) {
    const parsedNum = parseFloat(num);

    // for backspacing and input field becomes empty
    if (num === "") {
      return "";
    } else if (!Number.isNaN(parsedNum)) {
      return parsedNum;
    } else {
      console.error("Input is not a number");
      return undefined;
    }
  }

  clear(e) {
    e.preventDefault();
    this.setState({
      result: 0,
      num1: "",
      num2: ""
    });
  }

  operation(e) {
    e.preventDefault();
    let {num1, num2} = this.state;
    const mathSym = e.target.value;
    // allow floats 
    [num1, num2] = [parseFloat(num1), parseFloat(num2)];

    if (
        (num1 === "" || num2 === "") ||
        (Number.isNaN(num1)) || Number.isNaN(num2)
        ) {
      console.error("Must have two num arguments");
      return;
    }

    this._doMath(mathSym, num1, num2);
  }

  _doMath(op, num1, num2) {

    let answer;
    switch (op) {
      case "+":
        answer = num1 + num2;
        break;
      case "-":
        answer = num1 - num2;
        break;
      case "*":
        answer = num1 * num2;
        break;
      case "/":
        answer = num1 / num2;
        break;
    }
    console.log(answer);
    this.setState({result: answer});
  }

  render() {
    const {result, num1, num2} = this.state;
    return(
      <div>
        <h1>{result}</h1>
        <input type="text" onChange={this.setNum1} value={num1}></input>
        <input type="text" onChange={this.setNum2} value={num2}></input>
        <button onClick={this.clear}>Clear</button>
        <br/>
        <button onClick={this.operation} value="+">+</button>
        <button onClick={this.operation} value="-">-</button>
        <button onClick={this.operation} value="*">*</button>
        <button onClick={this.operation} value="/">/</button>
      </div>
    );
  }
}

export default Calculator;

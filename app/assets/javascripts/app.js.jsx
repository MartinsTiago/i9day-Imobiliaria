/**
 * @jsx React.DOM
 */

var App = React.createClass({

  getDefaultProps: function () {
    return {
      tipos: ['Aluguel', 'Venda'],
      finalidades: ['Comercial', 'Residencial']
    };
  },

  getInitialState: function () {
    return {
      tipo: 0,
      finalidade: 0,
      valor: 0
    };
  },

  handleValorChange: function () {
    this.setState({ valor: this.refs.valor.getDOMNode().value });
  },

  setTipo: function (i) {
    return function () {
      this.setState({ tipo: i });
      this.getData();
    }.bind(this);
  },

  setFinalidade: function (i) {
    return function () {
      this.setState({ finalidade: i });
      this.getData();
    }.bind(this);
  },

  getData: function () {
    $.getJSON('/property/show', { type: this.props.tipos[this.state.tipo], goal: this.props.finalidades[this.state.finalidade] })
      .done(function (data) {
        $(window).trigger('data', [data]);
      })
  },

  componentWillMount: function () {
    this.getData();
  },

  render: function () {
    return (
      <div className='app'>

        <h2>Tipo</h2>
        <ul className='sidebar-nav'>
          {
            this.props.tipos.map(function (t, i) {
              return <li className={ this.state.tipo === i ? 'selected' : ''} key={i}
                         onClick={ this.setTipo(i) }>{t}</li>
            }, this)
          }
        </ul>

        <h2>Finalidade</h2>
        <ul className='sidebar-nav'>
          {
            this.props.finalidades.map(function (f, i) {
              return <li className={ this.state.finalidade === i ? 'selected' : ''} key={i}
                         onClick={ this.setFinalidade(i) }>{f}</li>
            }, this)
          }
        </ul>

        <h2>Valor <span className='valor' >{this.state.valor}</span></h2>
        <ul className='sidebar-nav'>
            <li>
              <input type='range' min='0' max='100000' ref='valor' onChange={this.handleValorChange}
                     value={this.state.valor}/>
            </li>
        </ul>

      </div>
    );
  }

});

React.renderComponent(<App />, document.getElementById('sidebar-wrapper'))
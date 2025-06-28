import React, { useState } from 'react';

const ServerConfig = ({ config, onConfigChange }) => {
  const [isExpanded, setIsExpanded] = useState(false);
  const [tempConfig, setTempConfig] = useState(config);

  const handleSave = () => {
    onConfigChange(tempConfig);
    setIsExpanded(false);
  };

  const handleCancel = () => {
    setTempConfig(config);
    setIsExpanded(false);
  };

  return (
    <div className="metric-card" style={{ marginBottom: '20px' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <h3 style={{ margin: 0 }}>Server Configuration</h3>
        <button
          onClick={() => setIsExpanded(!isExpanded)}
          style={{
            padding: '5px 10px',
            backgroundColor: '#f0f0f0',
            border: '1px solid #ccc',
            borderRadius: '4px',
            cursor: 'pointer'
          }}
        >
          {isExpanded ? 'Hide' : 'Configure'}
        </button>
      </div>
      
      <div style={{ marginTop: '10px' }}>
        <strong>Current:</strong> {config.host}:{config.port}
      </div>

      {isExpanded && (
        <div style={{ marginTop: '15px' }}>
          <div style={{ marginBottom: '10px' }}>
            <label style={{ display: 'block', marginBottom: '5px' }}>
              Host:
              <input
                type="text"
                value={tempConfig.host}
                onChange={(e) => setTempConfig({ ...tempConfig, host: e.target.value })}
                style={{
                  marginLeft: '10px',
                  padding: '5px',
                  border: '1px solid #ccc',
                  borderRadius: '4px',
                  width: '200px'
                }}
              />
            </label>
          </div>
          <div style={{ marginBottom: '15px' }}>
            <label style={{ display: 'block', marginBottom: '5px' }}>
              Port:
              <input
                type="text"
                value={tempConfig.port}
                onChange={(e) => setTempConfig({ ...tempConfig, port: e.target.value })}
                style={{
                  marginLeft: '10px',
                  padding: '5px',
                  border: '1px solid #ccc',
                  borderRadius: '4px',
                  width: '100px'
                }}
              />
            </label>
          </div>
          <div>
            <button
              onClick={handleSave}
              style={{
                padding: '8px 16px',
                backgroundColor: '#0074cc',
                color: 'white',
                border: 'none',
                borderRadius: '4px',
                cursor: 'pointer',
                marginRight: '10px'
              }}
            >
              Save
            </button>
            <button
              onClick={handleCancel}
              style={{
                padding: '8px 16px',
                backgroundColor: '#6c757d',
                color: 'white',
                border: 'none',
                borderRadius: '4px',
                cursor: 'pointer'
              }}
            >
              Cancel
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default ServerConfig; 
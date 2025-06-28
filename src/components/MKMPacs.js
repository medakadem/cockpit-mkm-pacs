import React, { useState, useEffect, useCallback } from 'react';
import HealthStatus from './HealthStatus';
import MetricsDisplay from './MetricsDisplay';
import ServerConfig from './ServerConfig';

const MKMPacs = () => {
  const [healthData, setHealthData] = useState(null);
  const [metricsData, setMetricsData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [serverConfig, setServerConfig] = useState({
    host: 'localhost',
    port: '7070'
  });

  const fetchHealthData = useCallback(async () => {
    try {
      const response = await fetch(`http://${serverConfig.host}:${serverConfig.port}/api/monitoring/health`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setHealthData(data);
    } catch (err) {
      setError(`Failed to fetch health data: ${err.message}`);
    }
  }, [serverConfig]);

  const fetchMetricsData = useCallback(async () => {
    try {
      const response = await fetch(`http://${serverConfig.host}:${serverConfig.port}/api/monitoring/metrics`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setMetricsData(data);
    } catch (err) {
      setError(`Failed to fetch metrics data: ${err.message}`);
    }
  }, [serverConfig]);

  const fetchAllData = useCallback(async () => {
    setLoading(true);
    setError(null);
    
    await Promise.all([
      fetchHealthData(),
      fetchMetricsData()
    ]);
    
    setLoading(false);
  }, [fetchHealthData, fetchMetricsData]);

  useEffect(() => {
    fetchAllData();
  }, [fetchAllData]);

  const handleRefresh = () => {
    fetchAllData();
  };

  const handleServerConfigChange = (newConfig) => {
    setServerConfig(newConfig);
  };

  if (loading) {
    return (
      <div className="loading-spinner">
        <h2>Loading MKM PACS data...</h2>
        <p>Connecting to {serverConfig.host}:{serverConfig.port}</p>
      </div>
    );
  }

  return (
    <div>
      <h1>MKM PACS Monitoring</h1>
      
      <ServerConfig 
        config={serverConfig} 
        onConfigChange={handleServerConfigChange}
      />
      
      <button 
        className="refresh-button" 
        onClick={handleRefresh}
        style={{
          padding: '10px 20px',
          backgroundColor: '#0074cc',
          color: 'white',
          border: 'none',
          borderRadius: '4px',
          cursor: 'pointer'
        }}
      >
        Refresh Data
      </button>

      {error && (
        <div className="error-message">
          <strong>Error:</strong> {error}
        </div>
      )}

      <HealthStatus data={healthData} />
      <MetricsDisplay data={metricsData} />
    </div>
  );
};

export default MKMPacs; 
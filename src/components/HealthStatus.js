import React from 'react';

const HealthStatus = ({ data }) => {
  if (!data) {
    return (
      <div className="status-card">
        <div className="metric-card">
          <h2>Health Status</h2>
          <p>No health data available</p>
        </div>
      </div>
    );
  }

  const isHealthy = data.status === 'Healthy';

  return (
    <div className="status-card">
      <div className="metric-card">
        <h2>Health Status</h2>
        <div>
          <span className={`health-status ${isHealthy ? 'healthy' : 'unhealthy'}`}>
            {data.status}
          </span>
        </div>
        <div style={{ marginTop: '15px' }}>
          <div className="metric-label">Uptime</div>
          <div className="metric-value">{data.uptime}</div>
        </div>
      </div>
    </div>
  );
};

export default HealthStatus; 
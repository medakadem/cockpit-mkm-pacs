import React from 'react';

const MetricsDisplay = ({ data }) => {
  if (!data) {
    return (
      <div className="metrics-grid">
        <div className="metric-card">
          <h2>System Metrics</h2>
          <p>No metrics data available</p>
        </div>
      </div>
    );
  }

  const metrics = [
    { label: 'CPU Time', value: `${data.cpuTime}s`, key: 'cpuTime' },
    { label: 'Memory Usage', value: `${data.memoryMB} MB`, key: 'memoryMB' },
    { label: 'Database Size', value: `${data.dbFileSizeMB} MB`, key: 'dbFileSizeMB' },
    { label: 'Pending Uploads', value: data.pendingUploads, key: 'pendingUploads' },
    { label: 'Total Uploads', value: data.totalUploads, key: 'totalUploads' },
    { label: 'Version', value: data.version, key: 'version' }
  ];

  return (
    <div>
      <h2>System Metrics</h2>
      <div className="metrics-grid">
        {metrics.map((metric) => (
          <div key={metric.key} className="metric-card">
            <div className="metric-label">{metric.label}</div>
            <div className="metric-value">{metric.value}</div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default MetricsDisplay; 
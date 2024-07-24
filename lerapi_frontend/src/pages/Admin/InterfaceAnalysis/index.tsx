import { PageContainer } from '@ant-design/pro-components';
import '@umijs/max';
import React, { useEffect, useState } from 'react';
import ReactECharts from 'echarts-for-react';
import { listTopInvokeInterfaceInfoUsingGet } from "@/services/lerapi-backend/analysisController";

/**
 * 接口分析
 * @constructor
 */
const InterfaceAnalysis: React.FC = () => {

  const [data, setData] = useState<API.InterfaceInfoVO[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // 从远程获取数据
    const fetchData = async () => {
      try {
        const res = await listTopInvokeInterfaceInfoUsingGet();
        if (res.data) {
          setData(res.data);
        }
      } catch (e: any) {
        console.error("Failed to fetch data", e);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  const chartData = data.map(item => {
    return {
      value: item.totalNum,
      name: item.name,
    };
  });

  const option = {
    legend: {
      top: 'bottom'
    },
    toolbox: {
      show: true,
      feature: {
        mark: { show: true },
        dataView: { show: true, readOnly: false },
        restore: { show: true },
        saveAsImage: { show: true }
      }
    },
    series: [
      {
        name: 'Nightingale Chart',
        type: 'pie',
        radius: '50%',
        center: ['50%', '50%'],
        roseType: 'area',
        itemStyle: {
          borderRadius: 8
        },
        data: chartData,
      }
    ]
  };

  return (
    <PageContainer>
      <div style={{ width: '100%', height: '400px' }}>
        <ReactECharts
          showLoading={loading}
          option={option}
        />
      </div>
    </PageContainer>
  );
};

export default InterfaceAnalysis;

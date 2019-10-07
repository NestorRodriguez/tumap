import { TestBed } from '@angular/core/testing';

import { JydService } from './jyd.service';

describe('JydService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: JydService = TestBed.get(JydService);
    expect(service).toBeTruthy();
  });
});
